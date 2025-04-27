var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => $"Minimal API. {Environment.GetEnvironmentVariable("VERSION") ?? "Unknown Version"}");

app.Run();
