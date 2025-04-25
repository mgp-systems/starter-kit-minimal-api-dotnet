# Use the official .NET image as a build environment
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copy the project files and restore dependencies
COPY ./src/*.csproj ./
RUN dotnet restore

# Copy the rest of the application code
COPY ./src/. ./
RUN dotnet publish -c Release -o /publish

# Use the runtime image for the final image
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /publish .
EXPOSE 8080
ENTRYPOINT ["dotnet", "minimal-api.dll"]