using Microsoft.AspNetCore.Mvc;

namespace Blueskies.Api.Controllers
{
    [Route("[controller]")]
    public class PaymentsController : Controller
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok("PaymentsController");
        }

        [HttpPost]
        public IActionResult CreatePayment([FromBody] Payment payment)
        {
            int paymentId = 0;

            return Created($"{Request.Scheme}://{Request.Host}{Request.Path}/{paymentId}", payment);
        }
    }
}
