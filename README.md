# prls

Fetches and prints detailed information regarding featured plays and musicals from performance rights organizations (PROs).

Included PROs are:

- Dramatist's Play Service
- Concord Theatricals
- Music Theatre International
- Playscripts, Inc.
- Broadway Play Publishing, Inc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prls'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install prls

## Usage

After install:

    $ prls

This will load the user interface:

    PERFORMING RIGHTS LOOKUP SERVICE
    --------------------------------
    
    Select a PRO to see their currently featured plays:

    1. Dramatist's Play Service, Inc.
    2. Concord Theatricals (formerly Samuel French, Ltd.)
    3. Music Theatre International
    4. Playscripts, Inc.
    5. Broadway Play Publishing, Inc.

    To exit, type 'exit'.

Entering a pro will fetch information from that website, create play objects, and list them for further inspection.

    $ 1

    Loading...

    Here are Dramatist's Play Service, Inc.'s featured plays:

    1. Accidentally Brave
    2. All the Days
    3. Aunt Jack
    4. BLKS
    5. Deliver Us from Mama!
    6. Five Times in One Night
    7. Free Free Free Free
    8. Gary: A Sequel to Titus Andronicus
    9. Good Grief
    10. The Homecoming Queen
    11. Jump
    12. Long Lost
    13. Mac Beth
    14. Open
    15. Passage
    16. Sheepdog
    17. Six Years Old
    18. We Are Pussy Riot or Everything Is P.R.

    Which play would you like to learn more about?
    To return to the PROs menu, type 'pros'.
    To exit, type 'exit'.

User may loop through and learn more about as many plays from as many pros as they wish.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/justinmcla/prls. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/justinmcla/prls/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the prls project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/justinmcla/prls/blob/master/CODE_OF_CONDUCT.md).
