using Microsoft.AspNet.SignalR;

namespace SignalRDemo.Hubs
{
    public class Slide : Hub
    {
        public void GoToSlide(int slideIndex)
        {
            Clients.Others.goToSlide(slideIndex);
        }
    }
}