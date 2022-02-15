# sample-fluentbit-with-docker

## How to use

Performance test of fluent-bit on docker compose.

```
# diagram

dummer(10000 rate)
  --> fluentbit(0.5 CPU/20MiB Memory)
    --> /log/fluent-bit/dummer.log
```

Start performance test while 60 seconds with command below.

```sh
$ make performance-test-with-dummer
```

## bug 

Logging driver fluentd is sometimes hanging on.
This may from docker compose issues.

Remove large log file (like dummer.log) solve this problem, i guess.
