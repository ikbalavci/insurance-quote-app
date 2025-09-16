using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Data;
using SigortaApi.Models;

namespace SigortaApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SeyahatController : ControllerBase
{
    private readonly IConfiguration _configuration;

    public SeyahatController(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    [HttpPost("teklif")]
    public IActionResult GetTeklif([FromBody] SeyahatFormModel form)
    {
        try
        {
            using var connection = new MySqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            using var command = new MySqlCommand("sp_GetSeyahatTeklif", connection);
            command.CommandType = CommandType.StoredProcedure;

            // Parametreler
            command.Parameters.AddWithValue("@pSigortaTuru", form.SigortaTuru);
            command.Parameters.AddWithValue("@pTcKimlik", form.TcKimlik);
            command.Parameters.AddWithValue("@pDogumTarihi", form.DogumTarihi);
            command.Parameters.AddWithValue("@pTelefon", form.Telefon);
            command.Parameters.AddWithValue("@pEmail", form.Email);
            command.Parameters.AddWithValue("@pBolge", form.Bolge);
            command.Parameters.AddWithValue("@pUlke", form.Ulke);
            command.Parameters.AddWithValue("@pPaket", form.Paket);
            command.Parameters.AddWithValue("@pAxaUrun", form.AxaUrun);
            command.Parameters.AddWithValue("@pPandemi", form.Pandemi);
            command.Parameters.AddWithValue("@pKapkacTeminat", form.KapkacTeminat);
            command.Parameters.AddWithValue("@pSeyahatBaslangic", form.SeyahatBaslangic);
            command.Parameters.AddWithValue("@pSeyahatBitis", form.SeyahatBitis);
            command.Parameters.AddWithValue("@pMeslek", form.Meslek);


            connection.Open();
            using var reader = command.ExecuteReader();

            var teklifler = new List<object>();
            while (reader.Read())
            {
                teklifler.Add(new
                {
                    Firma = reader["Firma"].ToString(),
                    Fiyat = reader["Fiyat"].ToString(),
                    Aciklama = reader["Aciklama"].ToString()
                });
            }

            return Ok(teklifler);
        }
        catch (Exception ex)
        {
            return BadRequest(new { message = ex.Message });
        }
    }
}
