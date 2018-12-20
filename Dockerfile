FROM microsoft/dotnet:sdk AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY ./src/dotnet-core-simple-web-ui/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY ./src/dotnet-core-simple-web-ui/. ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "dotnet-core-simple-web-ui.dll"]