#define BLYNK_TEMPLATE_ID ""
#define BLYNK_DEVICE_NAME ""
#define BLYNK_AUTH_TOKEN ""

#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>

#include <DallasTemperature.h>
OneWire oneWire(D2);
DallasTemperature sensors(&oneWire);

#include <DHT.h>
DHT dht(D3, DHT11);  

char auth[] = BLYNK_AUTH_TOKEN;

char ssid[] = "";
char pass[] = "";

double temp;
double nem;

BlynkTimer timer;

void SendTempData()
{
   // dht11'in sıcaklık ölçümü berbat olduğu için ds18b20 kullanıyoruz
   // blynk, float göneremediği için double'ye castlıyoruz
  sensors.requestTemperatures(); 
  temp = (double) sensors.getTempCByIndex(0);
  nem = (double) dht.readHumidity();
  
  Blynk.virtualWrite(V1, temp);
  Blynk.virtualWrite(V2, temp);
}

void setup()
{
  Blynk.begin(auth, ssid, pass);
  timer.setInterval(300000L, SendTempData);

  pinMode(D1, OUTPUT);
  sensors.begin();
  dht.begin();
  SendTempData(); // 1 kerelik 
}

BLYNK_WRITE(V0)
{
  digitalWrite(D1, param.asInt());
}

void loop()
{
  Blynk.run();
  timer.run();
}
