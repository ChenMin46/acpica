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
     * Bug 66: CANCELED
     *
     * SUMMARY: FieldUnit type object should be passed to Methods without any conversion (to Buffer or Integer)
     *
     * EXAMPLES:
     *
     * ROOT CAUSE:
     *
     * SEE ALSO:     bugs 65,66,67,68,118
     */
    Method (MD81, 1, NotSerialized)
    {
        /* ObjectType of the value passed to Method */
        /* (FieldUnit is converted to Integer). */
        Local0 = ObjectType (Arg0)
        If ((Local0 != C009))
        {
            ERR ("", ZFFF, 0x30, 0x00, 0x00, Local0, C009)
        }
    }

    Method (MD82, 1, NotSerialized)
    {
        /* ObjectType of the value passed to Method */
        /* (FieldUnit is converted to Buffer). */
        Local0 = ObjectType (Arg0)
        If ((Local0 != C00B))
        {
            ERR ("", ZFFF, 0x3A, 0x00, 0x00, Local0, C00B)
        }
    }

    Method (MD83, 0, NotSerialized)
    {
        /* ObjectType of the FieldUnit immediately */

        Local0 = ObjectType (FD00)
        If ((Local0 != C00D))
        {
            ERR ("", ZFFF, 0x44, 0x00, 0x00, Local0, C00D)
        }

        Local0 = ObjectType (FD01)
        If ((Local0 != C00D))
        {
            ERR ("", ZFFF, 0x49, 0x00, 0x00, Local0, C00D)
        }

        MD81 (FD00)
        MD82 (FD01)
    }

