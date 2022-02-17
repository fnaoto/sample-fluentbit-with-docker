# sample-fluentbit-with-docker

## How to use

Performance test of fluent-bit and fluentd on docker compose.

```
# diagram

dummer(10000 rate)
  --> fluentbit(0.5 CPU/20MiB Memory)
    --> /log/fluent-bit/dummer.log

dummer(10000 rate)
  --> fluentd(0.5 CPU/100MiB Memory)
    --> /log/fluentd/dummer.log
```

Start performance test while 60 seconds with command below.

```sh
$ make performance-test-fluentbit
$ make performance-test-fluentd
```

## bug 

Logging driver fluentd is sometimes hanging on.
This may from docker compose issues.

Remove large log file (like dummer.log) solve this problem, i guess.
