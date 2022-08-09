# Waste No More
<details>
<summary> Table of Contents</summary>
<ol>
<li>About the Project</li>
<ul>
<li> Built With </li>
</ul>
<li> Getting Started </li>
<ul>
<li> Prerequisites </li>
<li> Installation </li>
</ul>
<li> EndPoints </li>
<ul>
<li> Thank you </li>
</ol>
</details>

## About the Project
Sweater Weather is the final project of Turing Module 3 Backend program. The purpose of this app is when a user inputs a location, they should get information on that locations weather. This app also allows to take user requests from a Frontend, save the data and produce an api key for the user. You can also plan a roadtrip and when a origin and destination is inputted, it will display the destinations weather based on the arrival time.

### Built With
- ![Ruby On Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
- ![Github](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
- ![PostgresSql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

## Getting Started

### Installation
1. Get your API key from these websites
- Mapquest Api - https://developer.mapquest.com/documentation/geocoding-api/
- OpenWeather - https://openweathermap.org/api

2. Clone the repo
`git@github.com:LukeSwenson06/sweater_weather.git`

3. Move into the file
`cd sweater_weather`

4. Install Gems
`bundle install`

5. Run `Bundle Exec Figaro Install` to generate `application.yml` file

6. In `application.yml` file, add api keys
- map_quest_api
- open_weather_api

7. Run `rails s` in terminal and go to send requests using `Postman`

8. Happy Hunting!

## End Points
#### Retrieve Weather for a City
```
GET /api/v1/forecast?location=denver,Co
```

```
{
  "data": {
      "id": null,
      "type": "forecast",
      "attributes": {
          "current_weather": {
              "datetime": "2022-08-09T15:19:44.000-06:00",
              "sunrise": "2022-08-09T06:06:29.000-06:00",
              "sunset": "2022-08-09T20:04:28.000-06:00",
              "temperature": 92.19,
              "feels_like": 88.97,
              "humidity": 23.0,
              "uvi": 7.55,
              "visibility": 10000,
              "conditions": "clear sky",
              "icon": "01d"
          },
          "daily_weather": [
              {
                  "date": "2022-08-09",
                  "sunrise": "2022-08-09T06:06:29.000-06:00",
                  "sunset": "2022-08-09T20:04:28.000-06:00",
                  "max_temp": 92.3,
                  "min_temp": 71.37,
                  "conditions": "clear sky",
                  "icon": "01d"
              },
              {
                  "date": "2022-08-10",
                  "sunrise": "2022-08-10T06:07:26.000-06:00",
                  "sunset": "2022-08-10T20:03:15.000-06:00",
                  "max_temp": 92.95,
                  "min_temp": 71.82,
                  "conditions": "clear sky",
                  "icon": "01d"
              },
              {
                  "date": "2022-08-11",
                  "sunrise": "2022-08-11T06:08:23.000-06:00",
                  "sunset": "2022-08-11T20:02:01.000-06:00",
                  "max_temp": 95.7,
                  "min_temp": 72.12,
                  "conditions": "clear sky",
                  "icon": "01d"
              },
              {
                  "date": "2022-08-12",
                  "sunrise": "2022-08-12T06:09:20.000-06:00",
                  "sunset": "2022-08-12T20:00:45.000-06:00",
                  "max_temp": 95.0,
                  "min_temp": 73.4,
                  "conditions": "clear sky",
                  "icon": "01d"
              },
              {
                  "date": "2022-08-13",
                  "sunrise": "2022-08-13T06:10:17.000-06:00",
                  "sunset": "2022-08-13T19:59:28.000-06:00",
                  "max_temp": 95.04,
                  "min_temp": 75.02,
                  "conditions": "clear sky",
                  "icon": "01d"
              }
          ],
          "hourly_weather": [
              {
                  "time": "15:00:00",
                  "temperature": 92.19,
                  "conditions": "clear sky",
                  "icon": "01d"
              },
              {
                  "time": "16:00:00",
                  "temperature": 92.3,
                  "conditions": "clear sky",
                  "icon": "01d"
              },
              {
                  "time": "17:00:00",
                  "temperature": 91.76,
                  "conditions": "few clouds",
                  "icon": "02d"
              },
              {
                  "time": "18:00:00",
                  "temperature": 91.81,
                  "conditions": "few clouds",
                  "icon": "02d"
              },
              {
                  "time": "19:00:00",
                  "temperature": 90.43,
                  "conditions": "clear sky",
                  "icon": "01d"
              },
              {
                  "time": "20:00:00",
                  "temperature": 85.05,
                  "conditions": "few clouds",
                  "icon": "02d"
              },
              {
                  "time": "21:00:00",
                  "temperature": 82.18,
                  "conditions": "few clouds",
                  "icon": "02n"
              },
              {
                  "time": "22:00:00",
                  "temperature": 80.42,
                  "conditions": "few clouds",
                  "icon": "02n"
              }
          ]
      }
  }
}
```

#### User Registration
```
POST /api/v1/users
```
```
{
  "email": "therealemail@email.com",
  "password": "12345",
  "password_confirmation": "12345"
}
```

#### Login
```
POST /api/v1/sessions
```
```
    {
    "data": {
        "type": "users",
        "id": 1,
        "attributes": {
            "email": "therealemail@email.com",
            "api_key": "immanapikey"
        }
    }
}
```
#### Road Trip
```
POST /api/v1/road_trip
```
```
  {
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "New York, NY",
            "end_city": "Panama, ",
            "travel_time": "80:04:20",
            "weather_at_eta": {
                "temperature": 82.53,
                "conditions": "moderate rain"
            }
        }
    }
}
```
# Thank You
