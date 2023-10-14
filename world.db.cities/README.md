# world.db.cities

world.db web app sample listing the world's greatest cities


## Live Demo

Try the live demo running on heroku @ [`worldcities.herokuapp.com`](http://worldcities.herokuapp.com)


## Setup in 1-2-3 Steps

Step 1: Install all libraries (gem) using bundler

    $ bundle install

Step 2: Download world.db datasets in a zip archive (~150 KiB); create world.db database and tables; load datasets using rake

    $ mkdir ./tmp       # world.db zip archive will get downloaded to tmp folder
    $ rake setup_world

or use individual tasks

    $ rake dl_world create_world load_world

Step 3: Startup the web server and open up the country codes page in your web browser

    $ rackup

That's it.


## License

The `world.db.cities` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Send them along to the [Open Mundi (world.db) Database Forum/Mailing List](http://groups.google.com/group/openmundi).
Thanks!
