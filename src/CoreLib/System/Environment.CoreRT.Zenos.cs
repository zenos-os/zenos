﻿using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;

namespace System
{
    public static partial class Environment
    {
        internal static int CurrentNativeThreadId => ManagedThreadId.Current;

        private static Dictionary<string, string> s_environment;

        private static string GetEnvironmentVariableCore(string variable)
        {
            Debug.Assert(variable != null);

            if (s_environment == null)
            {
                throw new NotImplementedException();
//                return Marshal.PtrToStringAnsi(Interop.Sys.GetEnv(variable));
            }

            lock (s_environment)
            {
                variable = TrimStringOnFirstZero(variable);
                s_environment.TryGetValue(variable, out string value);
                return value;
            }
        }

        private static void SetEnvironmentVariableCore(string variable, string value)
        {
            Debug.Assert(variable != null);

            EnsureEnvironmentCached();
            lock (s_environment)
            {
                variable = TrimStringOnFirstZero(variable);
                value = value == null ? null : TrimStringOnFirstZero(value);
                if (string.IsNullOrEmpty(value))
                {
                    s_environment.Remove(variable);
                }
                else
                {
                    s_environment[variable] = value;
                }
            }
        }

        public static IDictionary GetEnvironmentVariables()
        {
            var results = new Hashtable();

            EnsureEnvironmentCached();
            lock (s_environment)
            {
                foreach (var keyValuePair in s_environment)
                {
                    results.Add(keyValuePair.Key, keyValuePair.Value);
                }
            }

            return results;
        }

        private static string TrimStringOnFirstZero(string value)
        {
            int index = value.IndexOf('\0');
            if (index >= 0)
            {
                return value.Substring(0, index);
            }
            return value;
        }

        private static void EnsureEnvironmentCached()
        {
            if (s_environment == null)
            {
                Interlocked.CompareExchange(ref s_environment, GetSystemEnvironmentVariables(), null);
            }
        }

        private static Dictionary<string, string> GetSystemEnvironmentVariables()
        {
            var results = new Dictionary<string, string>();
            throw new NotImplementedException();
//            IntPtr block = Interop.Sys.GetEnviron();
//            if (block != IntPtr.Zero)
//            {
//                // Per man page, environment variables come back as an array of pointers to strings
//                // Parse each pointer of strings individually
//                while (ParseEntry(block, out string key, out string value))
//                {
//                    if (key != null && value != null)
//                        results.Add(key, value);
//
//                    // Increment to next environment variable entry
//                    block += IntPtr.Size;
//                }
//            }
//
//            return results;

            // Use a local, unsafe function since we cannot use `yield return` inside of an `unsafe` block
            unsafe bool ParseEntry(IntPtr current, out string key, out string value)
            {
                // Setup
                key = null;
                value = null;

                // Point to current entry
                byte* entry = *(byte**)current;

                // Per man page, "The last pointer in this array has the value NULL"
                // Therefore, if entry is null then we're at the end and can bail
                if (entry == null)
                    return false;

                // Parse each byte of the entry until we hit either the separator '=' or '\0'.
                // This finds the split point for creating key/value strings below.
                // On some old OS, the environment block can be corrupted.
                // Some will not have '=', so we need to check for '\0'. 
                byte* splitpoint = entry;
                while (*splitpoint != '=' && *splitpoint != '\0')
                    splitpoint++;

                // Skip over entries starting with '=' and entries with no value (just a null-terminating char '\0')
                if (splitpoint == entry || *splitpoint == '\0')
                    return true;

                // The key is the bytes from start (0) until our splitpoint
                key = new string((sbyte*)entry, 0, checked((int)(splitpoint - entry)));
                // The value is the rest of the bytes starting after the splitpoint
                value = new string((sbyte*)(splitpoint + 1));

                return true;
            }
        }

        private static void ExitRaw() => throw new NotImplementedException();  // Interop.Sys.Exit(s_latchedExitCode);

        internal static long TickCount64 => throw new NotImplementedException(); // (long)Interop.Sys.GetTickCount64();
    }
}
