# Ruby App

Receives a log file as argument (webserver.log is provided) and returns:

1. A list of webpages with most page views ordered from most pages views to less page views

2. A list of webpages with most unique page views also ordered

## Usage

```
bin/parser "-t", "--type [TYPE]" log_filename
```

> For the list of visits: `bin/parser webserver.log` (default type) or `bin/parser -t v webserver.log`

> For the lsit of unique visits: `bin/parser -t u webserver.log`