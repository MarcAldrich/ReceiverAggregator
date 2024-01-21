# ReceiverAggregator
ReceiverAggregator implements a REST API to integrate against while handling control and data connections with receivers.

# system overview

ReceiverAggregator is run as a container that listens to REST API requests to gather and decode results from R&S PR200 receivers.

# Receiver notes

1. UDP starts streaming instantly. Make sure client is listening before starting stream.
1. TCP waits for connection to begin stream.
1. PORTS
  1. 5555 Telnet
  1. TELNET+10 = generated->first tcp connection port
  

# DONE

  1. NOTHING!

# TODO

  0. Define API in protobuf
    1. Detect receivers.
      1. Scan IP range for ws://<ip>/scpi
      1. Scan range for port 5555
    1. GET *idn?
      1. Per receiver: Get serial and version string
    1. POST *rst
      1. Per receiver: soft reset
    1. QUERY Error register
    1. POST/PUT Start/stop Mass Data Stream
      1. UDP
      1. TCP
    1. CRUD Job:
      1. PScan
      1. DF
    1. CRUD Receiver Group
    1. <?possible?> Measure bandwidth options for mass data
    1. <?possible?> Calculate expected bandwidth use on given settings
  1. Create go main
  1. Build container using tilt
  1. Add NATS to system
  1. 
  1. Detect available receivers on an IP range.
  2. Connect WS port to each.
  3. Populate connected receivers with IDN?
  4. Start PScan.
  5. Gather mass data output via UDP.
  6. Decode UDP data.
  7. Push decoded data into NATS topics.
  8. Return results via REST API request by processing data in topics.
  1. Log output for 3rd party integration
  1. Event output for 3rd party integration
  1. User handling via external authz endpoint
