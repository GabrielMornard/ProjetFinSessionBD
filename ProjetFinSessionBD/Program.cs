using Microsoft.EntityFrameworkCore;
using ProjetFinSessionBD.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();

builder.Services.AddDbContext<Formule1Context>(
    options => options.UseSqlServer(builder.Configuration.GetConnectionString("Formule1")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Ecuries}/{action=Index}"
        );
});

app.MapRazorPages();

app.Run();
