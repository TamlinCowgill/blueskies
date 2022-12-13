using Microsoft.AspNetCore.Mvc;
using System;

namespace Blueskies.Api.Controllers
{
    [Route("[controller]")]
    public class SessionsController : Controller
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok("SessionsController");
        }

        [HttpPost]
        public IActionResult CreateSession()
        {
            var session = new Session();
            session.HostedTokenizationId = Guid.NewGuid().ToString();
            session.Url = $"{Request.Scheme}://{Request.Host}{Request.Path}/{session.HostedTokenizationId}";

            return Created($"{Request.Scheme}://{Request.Host}{Request.Path}/{session.HostedTokenizationId}", session);
        }
    }
}
