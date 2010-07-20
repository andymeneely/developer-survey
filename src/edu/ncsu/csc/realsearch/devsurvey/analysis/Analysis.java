package edu.ncsu.csc.realsearch.devsurvey.analysis;

public class Analysis {
	public static void main(String[] args) {
//		splitAnswer();
		splitTotals();
	}

	private static void splitTotals() {
		String answer = "total0:3, total1:0, total2:5, total3:5, total4:5, total5:3, total6:3, total7:0,";
		String[] split = answer.split("\\,");
		for(int i=0;i<8;i++){
			String total = split[i].replaceAll("total" + i + ":", "").trim();
			System.out.println(i + ": " + total);
		}
	}

	private static void splitAnswer() {
		String answer = "alejandro.vaquero@verso.com-2, jmayer@loplof.de-1, Uwe.Girlich@philosys.de-3, GMORRIS@novell.com-1, gerald@wireshark.org-1, ulf.lamping@web.de-1, tomas.kukosa@siemens.com-1, kovarththanan.rajaratnam@gmail.com-1, stig@bjorlykke.org-1, dimeg@intracom.gr-1,";
		String[] split = answer.split("[\\-|\\,]");
		for (String string : split) {
			System.out.println("Token: " + string);
		}
	}
}
