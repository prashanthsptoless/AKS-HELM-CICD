using Microsoft.AspNetCore.Mvc;
using parrot.Controllers;
using Xunit;

namespace parrot.UnitTests
{
    public class HomeControllerTest
    {
        [Fact]
        public  void Index_Returns_Result()
        {
            var controller = new HomeController();
           
            var result =  controller.Index();
           
            Assert.IsType<ViewResult>(result);
        }
    }
}