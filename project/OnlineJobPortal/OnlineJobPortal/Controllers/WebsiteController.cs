using Microsoft.AspNetCore.Mvc;
using OnlineJobPortal.Models;
using System.Diagnostics.Eventing.Reader;

namespace OnlineJobPortal.Controllers
{
    public class WebsiteController : Controller
    {
        public AppDbContext _context;
        public WebsiteController(AppDbContext context)
        {
            _context = context;
        }


        public IActionResult Index()
        {
            var data = _context.slider.ToList();
            var data1 = _context.category.Where(x => x.visiblestatus == true).ToList();

            var alldata = new HomePage
            {
                category = data1,
                slider = data
            };


            return View(alldata);
        }

        public IActionResult AdminLogin()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AdminLogin(string email, string password)
        {
            var data = _context.adminlogin.FirstOrDefault(x => x.email == email && x.password == password);
            if (data != null)
            {
                HttpContext.Session.SetString("admin", email);
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                TempData["msg"] = "Email or Password is incorrect";
                return RedirectToAction("AdminLogin");
            }
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult SaveRegister(register r)
        {
            var data = _context.register.FirstOrDefault(x => x.email == r.email || x.mobile == r.mobile);

            if (data == null)
            {
                _context.register.Add(r);
                _context.SaveChanges();

                TempData["alert"] = "registration_success";
                TempData["username"] = r.name;
                TempData["loginstatus"] = "true";
            }
            else
            {
                TempData["error"] = "Email or Mobile Already Registered";
            }


            return RedirectToAction("Register");
        }

        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Products(int id)
        {
            var data = _context.product.Where(x => x.cid == id).ToList();
            return View(data);
        }



        public IActionResult ProductDetails(int id)
        {
            var data = _context.product.Find(id);
            //ViewBag.categories = _context.category.Where(x=>x.visiblestatus == true).ToList();
            return View(data);
        }


        public IActionResult BuyNow(int id)
        {
            var data = _context.product.Find(id);
            return View(data);

        }

        [HttpPost]
        public IActionResult OrderNow(IFormCollection form)
        {
            singleorder order = new singleorder();

            order.name = form["name"];
            order.mobile = form["mobile"];
            order.email = form["email"];
            order.pincode = form["picode"];
            order.address = form["address"];
            order.productcid = form["id"];

            var data = _context.product.Find(int.Parse(form["id"].ToString()));

            //var data = _context.product.Find(form["id"]);

            order.productname = data.name;
            order.productprice = data.price;
            order.mode = form["paymentmode"];


            order.paymentstatus = "pending";
            order.transactionid = "0";

            _context.singleorder.Add(order);
            _context.SaveChanges();

            if (form["paymentmode"] == "cod")
            {
                return RedirectToAction("OrderPlaced");
            }
            else
            {
                TempData["name"] = order.name;
                TempData["email"] = order.email;
                TempData["mobile"] = order.mobile;
                TempData["amount"] = order.amount;
                TempData["orderid"] = order.id;

                return RedirectToAction("PayNow");
            }







        }

        public IActionResult OrderPlaced(int id)
        {

            return View();
        }



        public IActionResult PayNow()
        {
            return View();

        }

        public IActionResult PaymentSucess()
        {

            string txnid = Request.Query["txnid"];

            string orderid = Request.Query["orderid"];

            var data = _context.singleorder.Find(int.Parse(orderid));

            data.transactionid = txnid;
            data.paymentstatus = "Success";

            _context.singleorder.Update(data);
            _context.SaveChanges(true);


            return RedirectToAction("OrderPlaced");
        }

        public IActionResult PaymentFailed()
        {
            return View();
        }
    }
}
