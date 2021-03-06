﻿using Microsoft.AspNet.SignalR;
using System.Threading.Tasks;

namespace SignalRDemo.Hubs
{
    public class Slide : Hub
    {
        public void GoToSlide(int slideIndex)
        {
            Clients.Others.goToSlide(slideIndex);
        }

        public void AddClick(int x, int y, bool isDragging)
        {
            Clients.Others.addClick(x, y, isDragging);
        }

        public void ClearCanvas()
        {
            Clients.All.clearCanvas();
        }

        public void ShowDraw(string action)
        {
            Clients.Others.showDraw(action);
        }
    }
}