using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Data;
using SigortaApi.Models;

namespace SigortaApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PetController : ControllerBase
{
    private readonly IConfiguration _configuration;

    public PetController(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    [HttpPost("teklif")]
    public IActionResult GetTeklif([FromBody] PetFormModel form)
    {
        try
        {
            using var connection = new MySqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            using var command = new MySqlCommand("sp_GetPetTeklif", connection);
            command.CommandType = CommandType.StoredProcedure;

            // Parametreler
            command.Parameters.AddWithValue("@pSigortaTuru", form.SigortaTuru);
            command.Parameters.AddWithValue("@pTcKimlik", form.TcKimlik);
            command.Parameters.AddWithValue("@pDogumTarihi", form.DogumTarihi);
            command.Parameters.AddWithValue("@pTelefon", form.Telefon);
            command.Parameters.AddWithValue("@pEmail", form.Email);
            command.Parameters.AddWithValue("@pPetAdi", form.PetAdi);
            command.Parameters.AddWithValue("@pPetDogumTarihi", form.PetDogumTarihi);
            command.Parameters.AddWithValue("@pPetCinsiyet", form.PetCinsiyet);
            command.Parameters.AddWithValue("@pPetTuru", form.PetTuru);
            command.Parameters.AddWithValue("@pPetCinsi", form.PetCinsi);
            command.Parameters.AddWithValue("@pPetChipNo", form.PetChipNo);


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
