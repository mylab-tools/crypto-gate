echo off

IF [%1]==[] goto noparam

echo "Copy source ..."
xcopy /E /I /Y ..\src .\out\app

echo "Build image '%1' and 'latest'..."
docker build -t ozzyext/crypto-gate:%1 -t ozzyext/crypto-gate:latest .

echo "Publish image '%1' ..."
docker push ozzyext/crypto-gate:%1

echo "Publish image 'latest' ..."
docker push ozzyext/crypto-gate:latest

goto done

:noparam
echo "Please specify image version"
goto done

:done
echo "Done!"