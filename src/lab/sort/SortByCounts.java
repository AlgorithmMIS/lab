package lab.sort;

import java.util.Comparator;

import lab.bean.*;
public class SortByCounts implements Comparator{
	public int compare(Object o1, Object o2) {
		PaperInfor a1 = (PaperInfor) o1;
		PaperInfor a2 = (PaperInfor) o2;
		return a2.getCount()-a1.getCount();
	}
}
