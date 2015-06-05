# cobss-matlab

[Consistent Overhead Byte Stuffing](http://en.wikipedia.org/wiki/Consistent_Overhead_Byte_Stuffing) is an encoding that removes all zero bytes from arbitrary binary data. The encoded data consists only of bytes with values from 0x01 to 0xFF. This is useful for preparing data for transmission over a serial link (RS-232 or RS-485 for example), as the 0 byte can be used to unambiguously indicate packet boundaries. COBS also has the advantage of adding very little overhead (at least 1 byte, plus up to an additional byte per 254 bytes of data) and being computationally efficient.

This is a streaming (byte-wise) implementation for MATLAB for use in practical or simulated applications where encoded messages are not immediately available in their entirety and the user wishes to preview a decoded partial message or gradually build a message.

In memory-restricted hardware applications, a streaming approach can require much less memory than the block coded approach which requires memory for nearly twice the encoded message size.

I developed this specifically for use in my half-duplex [CSMA/CA for Serial Peripheral Interface](https://github.com/phyrwork/csma-ca-spi) project, which I am modelling in MATLAB before a hardware implementation. My MATLAB implementation of the faster, block coded approach is also available: [Consistent Overhead Byte Stuffing (COBS) for MATLAB]()
