    /*
     * Some or all of this work - Copyright (c) 2006 - 2017, Intel Corp.
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without modification,
     * are permitted provided that the following conditions are met:
     *
     * Redistributions of source code must retain the above copyright notice,
     * this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright notice,
     * this list of conditions and the following disclaimer in the documentation
     * and/or other materials provided with the distribution.
     * Neither the name of Intel Corporation nor the names of its contributors
     * may be used to endorse or promote products derived from this software
     * without specific prior written permission.
     *
     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
     * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
     * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
     * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
     * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
     * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
     * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
     * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
     * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
     * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */
    /*
     * Bug 154:
     *
     * SUMMARY: Exception occurs on attempt to rewrite Device type object passed by ArgX to Method
     *
     * Check that exception doesnt occur
     */
    Method (MF43, 1, NotSerialized)
    {
        Debug = Concatenate ("ObjectType(Arg0): 0x", Mid (ToHexString (ObjectType (Arg0)), 0x0F, 0x01)
            )
        Arg0 = 0x00
        Debug = "Store(0, Arg0) done"
    }

    Method (MF44, 0, NotSerialized)
    {
        MF43 (ID1D)
        Local0 = ObjectType (ID1D)
        If ((Local0 != C009))
        {
            ERR ("", ZFFF, 0x32, 0x00, 0x00, Local0, C009)
        }

        If ((ID1D != 0xFEDCBA9876543210))
        {
            ERR ("", ZFFF, 0x35, 0x00, 0x00, ID1D, 0xFEDCBA9876543210)
        }

        MF43 (ED02)
        Local0 = ObjectType (ED02)
        If ((Local0 != C00F))
        {
            ERR ("", ZFFF, 0x3B, 0x00, 0x00, Local0, C00F)
        }

        MF43 (DD0B)
        Local0 = ObjectType (DD0B)
        If ((Local0 != C00E))
        {
            ERR ("", ZFFF, 0x41, 0x00, 0x00, Local0, C00E)
        }
    }

