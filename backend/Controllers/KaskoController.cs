using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Data;
using SigortaApi.Models;

namespace SigortaApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class KaskoController : ControllerBase
{
    private readonly IConfiguration _configuration;

    public KaskoController(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    [HttpPost("teklif")]
    public IActionResult GetTeklif([FromBody] KaskoFormModel form)
    {
        try
        {
            using var connection = new MySqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            using var command = new MySqlCommand("sp_GetKaskoTeklif", connection);
            command.CommandType = CommandType.StoredProcedure;

            // Parametreler
            command.Parameters.AddWithValue("@pSigortaTuru", form.SigortaTuru);
            command.Parameters.AddWithValue("@pTcKimlik", form.TcKimlik);
            command.Parameters.AddWithValue("@pDogumTarihi", form.DogumTarihi);
            command.Parameters.AddWithValue("@pTelefon", form.Telefon);
            command.Parameters.AddWithValue("@pEmail", form.Email);
            command.Parameters.AddWithValue("@pPlakaSehri", form.PlakaSehri);
            command.Parameters.AddWithValue("@pModel", form.Model);
            command.Parameters.AddWithValue("@pMarka", form.Marka);
            command.Parameters.AddWithValue("@pModelYili", form.ModelYili);
            command.Parameters.AddWithValue("@pKullanimSekli", form.KullanimSekli);
            command.Parameters.AddWithValue("@pKullanimDetayi", form.KullanimDetayi);
            command.Parameters.AddWithValue("@pMotorNo", form.MotorNo);
            command.Parameters.AddWithValue("@pSasiNo", form.SasiNo);
            command.Parameters.AddWithValue("@pYolcuSayisi", form.YolcuSayisi);

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
