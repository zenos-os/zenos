// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using System;

namespace System.Runtime.InteropServices
{
    /// <summary>
    /// The McgGeneratedMarshallingCodeAttribute is applied to methods generated by
    /// MCG for interop marshalling.
    /// </summary>
    [AttributeUsage(System.AttributeTargets.Method | System.AttributeTargets.Constructor)]
    public class McgGeneratedMarshallingCodeAttribute : Attribute
    {
        //
        // Note: VS Debugger looks for this attribute by fullname "System.Runtime.InteropServices.McgGeneratedMarshallingCodeAttribute"
        // when stepping through MCG generated interop methods.
        // Make sure to update the logic in VS debugger too if you ever update the name of this attribute.
        //
    }
}