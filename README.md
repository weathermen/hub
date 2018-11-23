# Stormhub

A directory of [Soundstorm][] instances located at <https://hub.soundstorm.social>

## Features

* Shows the installed version of Soundstorm on the server
* Admins can edit and remove instances at user request

## Installation

Run the setup script:

```bash
$ ./bin/setup
```

Then, visit <https://stormhub.test> to view the app!

## Usage

Ping requests to `/instances.json` can be made with a payload similar to
the following:

```json
{
  "instance": {
    "host": "<YOUR SOUNDSTORM INSTANCE>",
    "version": "<CURRENTLY RUNNING VERSION OF SOUNDSTORM>"
  }
}
```

If you are logged in, you can also edit and delete instances with the
buttons adjacent to them in the listing. New accounts cannot be
registered, they can only be added within the `rails console`.

[Soundstorm]: https://man.sr.ht/~tubbo/soundstorm/
