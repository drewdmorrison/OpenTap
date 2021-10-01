package com.techelevator.model;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class HoursOfOperation {
    private String day;
    private String opened;
    private String closed;
    private LocalTime openedAsLocalTime;
    private LocalTime closedAsLocalTime;

    public HoursOfOperation() {
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getOpened() {
        return opened;
    }

    public void setOpened(String opened) {
        this.opened = opened;
    }

    public String getClosed() {
        return closed;
    }

    public void setClosed(String closed) {
        this.closed = closed;
    }

    public void setOpenedAsLocalTime(LocalTime openedAsLocalTime) {
        this.openedAsLocalTime = openedAsLocalTime;
    }

    public void setClosedAsLocalTime(LocalTime closedAsLocalTime) {
        this.closedAsLocalTime = closedAsLocalTime;
    }

    public LocalTime getOpenedAsLocalTime() {
        return openedAsLocalTime;
    }

    public LocalTime getClosedAsLocalTime() {
        return closedAsLocalTime;
    }

    public void setOpenedFromLocalTime(LocalTime opened) {
        this.opened = convertLocalTimeToString(opened);
    }

    public void setClosedFromLocalTime(LocalTime closed) {
        this.closed = convertLocalTimeToString(closed);
    }

    public void setDayFromInt(int dayAsInt) {
        this.day = convertToDay(dayAsInt);
    }

    public LocalTime getOpenedFromLocalTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mma");
        LocalTime openedAsLocalTime = LocalTime.parse(this.opened, formatter);
        return openedAsLocalTime;
    }

    public LocalTime getClosedFromLocalTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mma");
        LocalTime closedAsLocalTime = LocalTime.parse(this.closed, formatter);
        return closedAsLocalTime;
    }

    public int getDayAsInt() {
        return convertToDayInt(this.day);
    }

    private static String convertToDay(int x) {
        switch(x) {
            case 1: return "Monday";
            case 2: return "Tuesday";
            case 3: return "Wednesday";
            case 4: return "Thursday";
            case 5: return "Friday";
            case 6: return "Saturday";
            case 7: return "Sunday";
        }
        return "Error converting to string";
    }

    private static int convertToDayInt(String day) {
        switch(day) {
            case "Monday": return 1;
            case "Tuesday": return 2;
            case "Wednesday": return 3;
            case "Thursday": return 4;
            case "Friday": return 5;
            case "Saturday": return 6;
            case "Sunday": return 7;
        }
        return 0;
    }


    private static String convertLocalTimeToString(LocalTime time) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mma");
        return time.format(formatter);
    }


    @Override
    public String toString() {
        return "Day: " + this.day + " Opened: " + this.opened + " Closed: " + this.closed;
    }
}
