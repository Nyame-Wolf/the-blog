![](https://img.shields.io/badge/Microverse-blueviolet)

![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
# Ruby on Rails Blog App
A blog app created with RoR.

## Class diagram for the Database
<img width="1042" alt="Entity relationship Diagram" src="https://user-images.githubusercontent.com/48546992/196545579-b77b7d31-f8e2-421d-9db4-9d705bec701b.png">



## Getting Started
- Check the Ruby version or if you have at all by running `ruby -v` if it returns  `ruby 3.1.2p20 (2022-04-12 revision 4491bb740a)` or similar, you have Ruby installed.

* Ruby version used `ruby 3.1.2`

- Clone the repository by running
**ssh** `git clone git@github.com:Nyame-Wolf/the-blog.git`
**html** `https://github.com/Nyame-Wolf/the-blog.git` in your CLI.
- `cd blog-app`
- Run `bundle install`
- Run `rails server`
- Open Browser `http://localhost:3000/`

- Ensure you have postgresssql installed before running the application. `which psql` or `psql --version`
- Run `rails db:create`
- create a [.envs](https://medium.com/geekculture/postgresql-rails-and-macos-16248ddcc8ba) file using the link to host postgress credentials 

## tesing
To run tests:
 - ensure you have rspec installed: running bundle install will install it since I have included it in the gem file
 - To run a specific test:
 - Run `rspec spec/models<name_of_spec_file>`
 - To run all tests:
 - Run `rspec spec`


## Author

👤 *Mumenya Nyamu* 🧑🏻‍💻
- GitHub: [@Nyame-Wolf](https://github.com/Nyame-Wolf)
- Twitter: [@mumenyam](https://twitter.com/Mumenyam)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/mumenya-nyamu-software-engineer/)

## Acknowledgments

- [Microverse](https://www.microverse.org/)
- Coding Partners


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Nyame-Wolf/the-blog/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.





