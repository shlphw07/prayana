package com.request;
import java.util.List;

import lombok.Data;

@Data
public class request {
    private long budget;
    private int groupSize;
    private List<String> interests;
    private String accommodation;
    private int tripDuration;
    private int destinationType;
    private String dietaryRestrictions;
    private String transportation;
}
