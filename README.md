# maid-docker

This image was developed as a convenience cron running machine to schedule various file management tasks.

It includes the following useful packages:

- [Supercronic](https://github.com/aptible/supercronic) an awesome docker-friendly cron replacement to make it easy to schedule tasks in cron-compatible format inside docker containers (easy to run as non-root, logs to stdout, ...)
- [Maid](https://github.com/benjaminoakes/maid) a convenient Ruby-based script engine to specify various file handling tasks (trash/move files, select by glob / age...)
- [Calibre](https://calibre-ebook.com/) the famous ebook management system. This is used to schedule a regular import of ebooks into a shared Calibre Library folder.

## How to use

- Simply specify your tasks in a cron-formatted file and mount it to `/etc/maid/jobs.lst`. Go through the [Supercronic docs](https://github.com/aptible/supercronic) to understand potential differences with regular cron files (e.g. optinal second precision...). A default file is provided at that location.
- Optionally, specify your Maid rule file and mount it at `/etc/maid/rules.rb`. Refer to the [Maid docs](https://github.com/benjaminoakes/maid) for info on the syntax. They will not be auto-scheduled, they still need to be scheduled by Supercronic with a cron entry such as:

```
# Run every 2 minutes
*/2 * * * * maid clean -f -r /etc/maid/rules.rb
```

- To use the Calibre ebook import, you may run in your Maid rule file or direclty in a cron fine, a command such as:

```
`/calibre/calibredb add "/MyMountedFolder/Automatically Add to Calibre" -r --with-library="/MyMountedFolder/Calibre Library"
```
