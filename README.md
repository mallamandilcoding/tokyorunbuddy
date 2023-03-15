#🏃‍♂️🏃‍♂️🏃‍♂️ Tokyo Run Buddy

This is a mobile web application that suggests the user runs on their preferences such as time of day, weather, location, temperature and the user can save this suggested runs in their google calendar.
<br>
login credentials - user : sutairusu@me.com || password : 123123



https://user-images.githubusercontent.com/122031769/225224134-e6cac88a-14bf-47bf-93b7-0450e45e3751.mp4



![home](https://user-images.githubusercontent.com/122031769/224611706-bed35e95-975d-4af3-bd86-4b0e900fc2d4.png)
![show](https://user-images.githubusercontent.com/122031769/224610655-acdd4400-0eac-41f9-9869-7192dceda8b8.png)
![runs](https://user-images.githubusercontent.com/122031769/224610666-60b78d18-4d64-4ae3-beee-23c8e2852398.png)
![trends](https://user-images.githubusercontent.com/122031769/224610673-682ef489-6285-4cc9-89a4-ff44de285b44.png)





<br>
App home: https://www.tokyorunbuddy.live/
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
Inspired by Jane Mount's [Bibliophile](https://www.amazon.com/Bibliophile-Illustrated-Miscellany-Jane-Mount/dp/1452167230) and a story my father once told me: "Why do we keep books? ... We keep books because they remind us of the new perspectives and lessons we learned".

## Team Members
- [Mandil Malla](https://www.linkedin.com/in/mandil-malla/) | lead Developer
- [Kristoffer Stiles](https://www.linkedin.com/in/sutairusu/) | Backend Developer
- [Emika Sangu](https://www.linkedin.com/in/emika-sangu-10b466264/) | Frontend Developer

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
