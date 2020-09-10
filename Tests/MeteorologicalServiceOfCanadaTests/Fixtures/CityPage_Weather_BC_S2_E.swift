//
//  File.swift
//  
//
//  Created by Alan Chu on 9/10/20.
//

import Foundation

extension Fixtures {
    public static var CityPage_Weather_BC_S2_E: Data {
        return """
        <siteData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="https://dd.weather.gc.ca/citypage_weather/schema/site.xsd">
          <license>https://dd.weather.gc.ca/doc/LICENCE_GENERAL.txt</license>
          <dateTime name="xmlCreation" zone="UTC" UTCOffset="0">
            <year>2020</year>
            <month name="September">09</month>
            <day name="Thursday">10</day>
            <hour>17</hour>
            <minute>09</minute>
            <timeStamp>20200910170900</timeStamp>
            <textSummary>Thursday September 10, 2020 at 17:09 UTC</textSummary>
          </dateTime>
          <dateTime name="xmlCreation" zone="PDT" UTCOffset="-7">
            <year>2020</year>
            <month name="September">09</month>
            <day name="Thursday">10</day>
            <hour>10</hour>
            <minute>09</minute>
            <timeStamp>20200910100900</timeStamp>
            <textSummary>Thursday September 10, 2020 at 10:09 PDT</textSummary>
          </dateTime>
          <location>
            <continent>North America</continent>
            <country code="ca">Canada</country>
            <province code="bc">British Columbia</province>
            <name code="s0000002" lat="51.65N" lon="120.03W">Clearwater</name>
            <region>North Thompson</region>
          </location>
          <warnings/>
          <currentConditions>
            <station code="vcw" lat="51.65N" lon="120.08W">Clearwater</station>
            <dateTime name="observation" zone="UTC" UTCOffset="0">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Thursday">10</day>
              <hour>17</hour>
              <minute>00</minute>
              <timeStamp>20200910170000</timeStamp>
              <textSummary>Thursday September 10, 2020 at 17:00 UTC</textSummary>
            </dateTime>
            <dateTime name="observation" zone="PDT" UTCOffset="-7">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Thursday">10</day>
              <hour>10</hour>
              <minute>00</minute>
              <timeStamp>20200910100000</timeStamp>
              <textSummary>Thursday September 10, 2020 at 10:00 PDT</textSummary>
            </dateTime>
            <condition/>
            <iconCode format="gif"/>
            <temperature unitType="metric" units="C">16.2</temperature>
            <dewpoint unitType="metric" units="C">7.7</dewpoint>
            <pressure unitType="metric" units="kPa" change="0.09" tendency="falling">102.0</pressure>
            <visibility unitType="metric" units="km"/>
            <relativeHumidity units="%">57</relativeHumidity>
            <wind>
              <speed unitType="metric" units="km/h">4</speed>
              <gust unitType="metric" units="km/h"/>
              <direction>ESE</direction>
              <bearing units="degrees">120.8</bearing>
            </wind>
          </currentConditions>
          <forecastGroup>
            <dateTime name="forecastIssue" zone="UTC" UTCOffset="0">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Thursday">10</day>
              <hour>18</hour>
              <minute>00</minute>
              <timeStamp>20200910180000</timeStamp>
              <textSummary>Thursday September 10, 2020 at 18:00 UTC</textSummary>
            </dateTime>
            <dateTime name="forecastIssue" zone="PDT" UTCOffset="-7">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Thursday">10</day>
              <hour>11</hour>
              <minute>00</minute>
              <timeStamp>20200910110000</timeStamp>
              <textSummary>Thursday September 10, 2020 at 11:00 PDT</textSummary>
            </dateTime>
            <regionalNormals>
              <textSummary>Low 6. High 20.</textSummary>
              <temperature unitType="metric" units="C" class="high">20</temperature>
              <temperature unitType="metric" units="C" class="low">6</temperature>
            </regionalNormals>
            <forecast>
              <period textForecastName="Today">Thursday</period>
              <textSummary>Sunny. High 31. UV index 7 or high.</textSummary>
              <cloudPrecip>
                <textSummary>Sunny.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">00</iconCode>
                <pop units="%"/>
                <textSummary>Sunny</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>High 31.</textSummary>
                <temperature unitType="metric" units="C" class="high">31</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="" end=""/>
              </precipitation>
              <uv category="high">
                <index>7</index>
                <textSummary>UV index 7 or high.</textSummary>
              </uv>
              <relativeHumidity units="%">20</relativeHumidity>
              <comfort>
                <textSummary>hot.</textSummary>
              </comfort>
            </forecast>
            <forecast>
              <period textForecastName="Tonight">Thursday night</period>
              <textSummary>Clear. Low 8.</textSummary>
              <cloudPrecip>
                <textSummary>Clear.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">30</iconCode>
                <pop units="%"/>
                <textSummary>Clear</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>Low 8.</textSummary>
                <temperature unitType="metric" units="C" class="low">8</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="" end=""/>
              </precipitation>
              <relativeHumidity units="%">95</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Friday">Friday</period>
              <textSummary>Sunny. High 30. UV index 6 or high.</textSummary>
              <cloudPrecip>
                <textSummary>Sunny.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">00</iconCode>
                <pop units="%"/>
                <textSummary>Sunny</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>High 30.</textSummary>
                <temperature unitType="metric" units="C" class="high">30</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="" end=""/>
              </precipitation>
              <uv category="high">
                <index>6</index>
                <textSummary>UV index 6 or high.</textSummary>
              </uv>
              <relativeHumidity units="%">20</relativeHumidity>
              <comfort>
                <textSummary>hot.</textSummary>
              </comfort>
            </forecast>
            <forecast>
              <period textForecastName="Friday night">Friday night</period>
              <textSummary>Clear. Low 10.</textSummary>
              <cloudPrecip>
                <textSummary>Clear.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">30</iconCode>
                <pop units="%"/>
                <textSummary>Clear</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>Low 10.</textSummary>
                <temperature unitType="metric" units="C" class="low">10</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="" end=""/>
              </precipitation>
              <relativeHumidity units="%">60</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Saturday">Saturday</period>
              <textSummary>Sunny. High 27.</textSummary>
              <cloudPrecip>
                <textSummary>Sunny.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">00</iconCode>
                <pop units="%"/>
                <textSummary>Sunny</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>High 27.</textSummary>
                <temperature unitType="metric" units="C" class="high">27</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="" end=""/>
              </precipitation>
              <relativeHumidity units="%">15</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Saturday night">Saturday night</period>
              <textSummary>Clear. Low 8.</textSummary>
              <cloudPrecip>
                <textSummary>Clear.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">30</iconCode>
                <pop units="%"/>
                <textSummary>Clear</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>Low 8.</textSummary>
                <temperature unitType="metric" units="C" class="low">8</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="" end=""/>
              </precipitation>
              <relativeHumidity units="%">60</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Sunday">Sunday</period>
              <textSummary>Sunny. High 28.</textSummary>
              <cloudPrecip>
                <textSummary>Sunny.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">00</iconCode>
                <pop units="%"/>
                <textSummary>Sunny</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>High 28.</textSummary>
                <temperature unitType="metric" units="C" class="high">28</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="" end=""/>
              </precipitation>
              <relativeHumidity units="%">15</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Sunday night">Sunday night</period>
              <textSummary>Clear. Low 10.</textSummary>
              <cloudPrecip>
                <textSummary>Clear.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">30</iconCode>
                <pop units="%"/>
                <textSummary>Clear</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>Low 10.</textSummary>
                <temperature unitType="metric" units="C" class="low">10</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="" end=""/>
              </precipitation>
              <relativeHumidity units="%">60</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Monday">Monday</period>
              <textSummary>A mix of sun and cloud. High 23.</textSummary>
              <cloudPrecip>
                <textSummary>A mix of sun and cloud.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">02</iconCode>
                <pop units="%"/>
                <textSummary>A mix of sun and cloud</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>High 23.</textSummary>
                <temperature unitType="metric" units="C" class="high">23</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="" end=""/>
              </precipitation>
              <relativeHumidity units="%">25</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Monday night">Monday night</period>
              <textSummary>Cloudy with 60 percent chance of showers. Low 9.</textSummary>
              <cloudPrecip>
                <textSummary>Cloudy with 60 percent chance of showers.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">12</iconCode>
                <pop units="%">60</pop>
                <textSummary>Chance of showers</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>Low 9.</textSummary>
                <temperature unitType="metric" units="C" class="low">9</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="120" end="132">rain</precipType>
              </precipitation>
              <relativeHumidity units="%">80</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Tuesday">Tuesday</period>
              <textSummary>Cloudy with 30 percent chance of showers. High 18.</textSummary>
              <cloudPrecip>
                <textSummary>Cloudy with 30 percent chance of showers.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">12</iconCode>
                <pop units="%">30</pop>
                <textSummary>Chance of showers</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>High 18.</textSummary>
                <temperature unitType="metric" units="C" class="high">18</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="138" end="144">rain</precipType>
              </precipitation>
              <relativeHumidity units="%">50</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Tuesday night">Tuesday night</period>
              <textSummary>Cloudy with 60 percent chance of showers. Low 8.</textSummary>
              <cloudPrecip>
                <textSummary>Cloudy with 60 percent chance of showers.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">12</iconCode>
                <pop units="%">60</pop>
                <textSummary>Chance of showers</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>Low 8.</textSummary>
                <temperature unitType="metric" units="C" class="low">8</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="144" end="156">rain</precipType>
              </precipitation>
              <relativeHumidity units="%">85</relativeHumidity>
            </forecast>
            <forecast>
              <period textForecastName="Wednesday">Wednesday</period>
              <textSummary>A mix of sun and cloud with 30 percent chance of showers. High 17.</textSummary>
              <cloudPrecip>
                <textSummary>A mix of sun and cloud with 30 percent chance of showers.</textSummary>
              </cloudPrecip>
              <abbreviatedForecast>
                <iconCode format="gif">06</iconCode>
                <pop units="%">30</pop>
                <textSummary>Chance of showers</textSummary>
              </abbreviatedForecast>
              <temperatures>
                <textSummary>High 17.</textSummary>
                <temperature unitType="metric" units="C" class="high">17</temperature>
              </temperatures>
              <winds/>
              <humidex/>
              <precipitation>
                <textSummary/>
                <precipType start="162" end="168">rain</precipType>
              </precipitation>
              <relativeHumidity units="%">45</relativeHumidity>
            </forecast>
          </forecastGroup>
          <hourlyForecastGroup>
            <dateTime name="forecastIssue" zone="UTC" UTCOffset="0">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Thursday">10</day>
              <hour>17</hour>
              <minute>00</minute>
              <timeStamp>20200910170000</timeStamp>
              <textSummary>Thursday September 10, 2020 at 17:00 UTC</textSummary>
            </dateTime>
            <dateTime name="forecastIssue" zone="MDT" UTCOffset="-6">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Thursday">10</day>
              <hour>11</hour>
              <minute>00</minute>
              <timeStamp>20200910110000</timeStamp>
              <textSummary>Thursday September 10, 2020 at 11:00 MDT</textSummary>
            </dateTime>
            <hourlyForecast dateTimeUTC="202009101800">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">21</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009101900">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">23</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009102000">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">26</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009102100">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">28</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009102200">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">29</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009102300">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">30</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110000">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">31</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110100">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">28</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110200">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">26</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110300">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">23</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110400">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">20</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110500">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">18</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110600">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">15</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110700">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">14</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110800">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">13</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009110900">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">12</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009111000">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">11</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009111100">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">9</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009111200">
              <condition>Clear</condition>
              <iconCode format="png">30</iconCode>
              <temperature unitType="metric" units="C">8</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009111300">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">9</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009111400">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">11</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009111500">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">12</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009111600">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">14</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
            <hourlyForecast dateTimeUTC="202009111700">
              <condition>Sunny</condition>
              <iconCode format="png">00</iconCode>
              <temperature unitType="metric" units="C">17</temperature>
              <lop category="Nil" units="%">0</lop>
              <windChill unitType="metric"/>
              <humidex/>
              <wind>
                <speed unitType="metric" units="km/h">5</speed>
                <direction windDirFull="Variable direction">VR</direction>
                <gust unitType="metric" units="km/h"/>
              </wind>
            </hourlyForecast>
          </hourlyForecastGroup>
          <yesterdayConditions>
            <temperature unitType="metric" units="C" class="high">28.1</temperature>
            <temperature unitType="metric" units="C" class="low">4.9</temperature>
            <precip unitType="metric" units="mm"/>
          </yesterdayConditions>
          <riseSet>
            <disclaimer>The information provided here, for the times of the rise and set of the sun, is an estimate included as a convenience to our clients. Values shown here may differ from the official sunrise/sunset data available from (http://hia-iha.nrc-cnrc.gc.ca/sunrise_e.html)</disclaimer>
            <dateTime name="sunrise" zone="UTC" UTCOffset="0">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Thursday">10</day>
              <hour>13</hour>
              <minute>27</minute>
              <timeStamp>20200910132700</timeStamp>
              <textSummary>Thursday September 10, 2020 at 13:27 UTC</textSummary>
            </dateTime>
            <dateTime name="sunrise" zone="PDT" UTCOffset="-7">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Thursday">10</day>
              <hour>06</hour>
              <minute>27</minute>
              <timeStamp>20200910062700</timeStamp>
              <textSummary>Thursday September 10, 2020 at 06:27 PDT</textSummary>
            </dateTime>
            <dateTime name="sunset" zone="UTC" UTCOffset="0">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Friday">11</day>
              <hour>02</hour>
              <minute>26</minute>
              <timeStamp>20200911022600</timeStamp>
              <textSummary>Friday September 11, 2020 at 02:26 UTC</textSummary>
            </dateTime>
            <dateTime name="sunset" zone="PDT" UTCOffset="-7">
              <year>2020</year>
              <month name="September">09</month>
              <day name="Thursday">10</day>
              <hour>19</hour>
              <minute>26</minute>
              <timeStamp>20200910192600</timeStamp>
              <textSummary>Thursday September 10, 2020 at 19:26 PDT</textSummary>
            </dateTime>
          </riseSet>
          <almanac>
            <temperature class="extremeMax" period="2014-2019" unitType="metric" units="C" year="2015">25.6</temperature>
            <temperature class="extremeMin" period="2014-2019" unitType="metric" units="C" year="2014">0.3</temperature>
            <temperature class="normalMax" unitType="metric" units="C"/>
            <temperature class="normalMin" unitType="metric" units="C"/>
            <temperature class="normalMean" unitType="metric" units="C"/>
            <precipitation class="extremeRainfall" period="-" unitType="metric" units="mm" year=""/>
            <precipitation class="extremeSnowfall" period="-" unitType="metric" units="cm" year=""/>
            <precipitation class="extremePrecipitation" period="2014-2017" unitType="metric" units="mm" year="2016">0.8</precipitation>
            <precipitation class="extremeSnowOnGround" period="-" unitType="metric" units="cm" year=""/>
            <pop units="%"/>
          </almanac>
        </siteData>
        """.data(using: .utf8)!
    }
}
