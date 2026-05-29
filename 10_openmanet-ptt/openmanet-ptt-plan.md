# OpenMANET Push-To-Talk Plan

Status: planned, not tested

OpenMANET 1.7.0 introduced voice comms, OpenVLM hardware support, BLOS, an experimental Web UI, and API support. This plan captures how to test PTT without assuming unsupported behavior on HaLowLink2.

## Grounded Findings

- OpenMANET comms is multicast voice over RTP.
- Audio codec is Opus.
- Talk groups map to multicast address/port definitions.
- RTP ports are paired with RTCP on `port + 1`.
- Web mode lets a browser act as the audio device.
- OpenVLM is the hardware PTT path.
- ATAK Voice plugin interop is possible through RTP multicast mode when address, port, and protocol match.
- OpenMANET's docs say HaLowLink2 comms is not supported on `1.7.0` yet.

## Target Architecture

```text
ATAK / browser / OpenVLM endpoint
        |
        | Ethernet or node AP
        v
OpenMANET mesh point
        |
        | br-ahwlan -> bat0 -> HaLow 802.11s
        v
OpenMANET mesh point / gate
```

HaLowLink2 can be used as the transport layer if OpenMANET/BATMAN transport is stable. PTT should be hosted by a supported endpoint until HaLowLink2 comms support is verified.

## Bench Sequence

1. Build a stable OpenMANET transport baseline.
2. Confirm clients receive `10.41.x.x` addresses on the mesh.
3. Confirm `batctl` sees neighbors/originators.
4. Select a supported comms endpoint:
   - Pi/Venice/OpenMANET node with sound support
   - OpenVLM hardware endpoint
   - Web UI comms over HTTPS
   - ATAK Android device with Voice plugin
5. Enable one talk group.
6. Capture PTT traffic on the mesh interface:

   ```sh
   tcpdump -i br-ahwlan -n udp and portrange 38801-38809
   ```

7. Test one-way audio.
8. Test two-way audio.
9. Record dropped frames, encode errors, jitter, packet loss, and subjective audio quality.

## ATAK Voice Plugin Gate

Before claiming ATAK interop:

- Android device is on the OpenMANET mesh and has a `10.41.x.x` address.
- Voice plugin mission type is Multicast.
- Protocol is RTP, not raw UDP.
- Multicast IP and port match the OpenMANET talk group.
- Packet capture shows traffic both directions.
- Audio is heard both directions.

## Failure Modes To Watch

- Codec/RTP payload mismatch.
- Browser microphone blocked because HTTPS/self-signed cert was not accepted.
- Multicast not crossing because the client is not on the same L2/OpenMANET mesh domain.
- HaLowLink2 CPU/storage limits preventing local comms service.
- Talk group collision because ATAK users can transmit over one another while OpenMANET enforces half-duplex.

## Boundary

No PTT-over-MANET test has been completed yet.

Do not describe this project as having working OpenMANET PTT until the bench sequence above passes and is recorded in the test log.
