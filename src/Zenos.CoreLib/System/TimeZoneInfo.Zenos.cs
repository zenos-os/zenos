using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Security;
using System.Text;
using System.Threading;
using Internal.IO;

namespace System
{
    public sealed partial class TimeZoneInfo
    {
        public AdjustmentRule[] GetAdjustmentRules()
        {
            throw new NotImplementedException();
        }


        // DateTime.Now fast path that avoids allocating an historically accurate TimeZoneInfo.Local and just creates a 1-year (current year) accurate time zone
        internal static TimeSpan GetDateTimeNowUtcOffsetFromUtc(DateTime time, out bool isAmbiguousLocalDst)
        {
            bool isDaylightSavings;
            // Use the standard code path for Unix since there isn't a faster way of handling current-year-only time zones
            return GetUtcOffsetFromUtc(time, Local, out isDaylightSavings, out isAmbiguousLocalDst);
        }

        /// <summary>
        /// Helper function for retrieving the local system time zone.
        /// May throw COMException, TimeZoneNotFoundException, InvalidTimeZoneException.
        /// Assumes cachedData lock is taken.
        /// </summary>
        /// <returns>A new TimeZoneInfo instance.</returns>
        private static TimeZoneInfo GetLocalTimeZone(CachedData cachedData)
        {
           throw new NotImplementedException();
        }

        private static TimeZoneInfoResult TryGetTimeZoneFromLocalMachine(string id, out TimeZoneInfo value, out Exception e)
        {
            throw new NotImplementedException();
//            value = null;
//            e = null;
//
//            string timeZoneDirectory = GetTimeZoneDirectory();
//            string timeZoneFilePath = Path.Combine(timeZoneDirectory, id);
//            byte[] rawData;
//            try
//            {
//                rawData = File.ReadAllBytes(timeZoneFilePath);
//            }
//            catch (UnauthorizedAccessException ex)
//            {
//                e = ex;
//                return TimeZoneInfoResult.SecurityException;
//            }
//            catch (FileNotFoundException ex)
//            {
//                e = ex;
//                return TimeZoneInfoResult.TimeZoneNotFoundException;
//            }
//            catch (DirectoryNotFoundException ex)
//            {
//                e = ex;
//                return TimeZoneInfoResult.TimeZoneNotFoundException;
//            }
//            catch (IOException ex)
//            {
//                e = new InvalidTimeZoneException(SR.Format(SR.InvalidTimeZone_InvalidFileData, id, timeZoneFilePath), ex);
//                return TimeZoneInfoResult.InvalidTimeZoneException;
//            }
//
//            value = GetTimeZoneFromTzData(rawData, id);
//
//            if (value == null)
//            {
//                e = new InvalidTimeZoneException(SR.Format(SR.InvalidTimeZone_InvalidFileData, id, timeZoneFilePath));
//                return TimeZoneInfoResult.InvalidTimeZoneException;
//            }
//
//            return TimeZoneInfoResult.Success;
        }

        private static void PopulateAllSystemTimeZones(CachedData cachedData)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Helper function for retrieving a TimeZoneInfo object by time_zone_name.
        /// This function wraps the logic necessary to keep the private
        /// SystemTimeZones cache in working order
        ///
        /// This function will either return a valid TimeZoneInfo instance or
        /// it will throw 'InvalidTimeZoneException' / 'TimeZoneNotFoundException'.
        /// </summary>
        public static TimeZoneInfo FindSystemTimeZoneById(string id)
        {
            // Special case for Utc as it will not exist in the dictionary with the rest
            // of the system time zones.  There is no need to do this check for Local.Id
            // since Local is a real time zone that exists in the dictionary cache
            if (string.Equals(id, UtcId, StringComparison.OrdinalIgnoreCase))
            {
                return Utc;
            }

            if (id == null)
            {
                throw new ArgumentNullException(nameof(id));
            }
            else if (id.Length == 0 || id.Contains('\0'))
            {
                throw new TimeZoneNotFoundException(SR.Format(SR.TimeZoneNotFound_MissingData, id));
            }

            TimeZoneInfo value;
            Exception e;

            TimeZoneInfoResult result;

            CachedData cachedData = s_cachedData;

            lock (cachedData)
            {
                result = TryGetTimeZone(id, false, out value, out e, cachedData, alwaysFallbackToLocalMachine: true);
            }

            if (result == TimeZoneInfoResult.Success)
            {
                return value;
            }
            else if (result == TimeZoneInfoResult.InvalidTimeZoneException)
            {
                Debug.Assert(e is InvalidTimeZoneException,
                    "TryGetTimeZone must create an InvalidTimeZoneException when it returns TimeZoneInfoResult.InvalidTimeZoneException");
                throw e;
            }
            else if (result == TimeZoneInfoResult.SecurityException)
            {
                throw new SecurityException(SR.Format(SR.Security_CannotReadFileData, id), e);
            }
            else
            {
                throw new TimeZoneNotFoundException(SR.Format(SR.TimeZoneNotFound_MissingData, id), e);
            }
        }
    }
}
