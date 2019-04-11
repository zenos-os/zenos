using System;
using System.Collections.Generic;
using System.Text;

namespace System.Globalization
{
    partial class CalendarData
    {
        private bool LoadCalendarDataFromSystem(string localeName, CalendarId calendarId)
        {
            throw new NotImplementedException();
        }

        private static bool SystemSupportsTaiwaneseCalendar()
        {
            return false;
        }

        internal static int GetCalendars(string localeName, bool useUserOverride, CalendarId[] calendars)
        {
            throw new NotImplementedException();
        }

        internal static int GetTwoDigitYearMax(CalendarId calendarId)
        {
            // There is no user override for this value on Linux or in ICU.
            // So just return -1 to use the hard-coded defaults.
            return -1;
        }
    }
}
