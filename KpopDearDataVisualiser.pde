// K-pop Dear Data: first 25 observations, 12-13 October 2026
// Open this sketch in a NEW Processing window (Java mode).
// Keep only this one .pde file in the sketch folder.

ArrayList<KpopEntry> kpopEntries = new ArrayList<KpopEntry>();
PFont kpopFont;

String[] kpopPlatforms = {"TikTok", "Spotify", "Instagram", "Weverse", "YouTube"};
String[] kpopPeriods = {"Morning", "Afternoon", "Evening", "Late night"};
color[] kpopColours = {#D88CBA, #8A85C9, #8EB6B4, #D8AB78, #B8A2CE};

void setup() {
  size(1800, 850);
  kpopFont = createFont("Arial", 16);
  textFont(kpopFont);
  addKpopData();
  noLoop();
}

void draw() {
  background(#FAF5EF);
  fill(#35303C);
  textSize(30);
  text("my k-pop diary", 55, 62);
  textSize(14);
  fill(#77707B);
  text("12–13 October 2026  |  25 moments I recorded", 57, 88);

  drawKpopNote(55, 118, 275, 90, "observations", str(kpopEntries.size()));
  drawKpopNote(362, 118, 275, 90, "time spent", getKpopTime() + " min");
  drawKpopNote(669, 118, 275, 90, "repeated", getKpopRepeated() + " times");

  fill(#35303C);
  textSize(20);
  text("where I spent my time", 58, 268);
  textSize(13);
  fill(#77707B);
  text("Each circle is one observation", 58, 292);

  // Platform observations: one coloured dot per recorded entry.
  for (int i = 0; i < kpopPlatforms.length; i++) {
    int total = countKpopPlatform(kpopPlatforms[i]);
    int y = 335 + i * 58;
    fill(#35303C);
    textSize(15);
    text(kpopPlatforms[i], 58, y + 7);
    for (int j = 0; j < total; j++) {
      noStroke();
      fill(kpopColours[i]);
      circle(185 + j * 30, y, 20);
    }
    fill(#77707B);
    text(total, 510, y + 7);
  }

  fill(#35303C);
  textSize(20);
  text("when I checked in", 600, 268);
  textSize(13);
  fill(#77707B);
  text("Number of entries by time of day", 600, 292);

  for (int i = 0; i < kpopPeriods.length; i++) {
    int total = countKpopPeriod(kpopPeriods[i]);
    int y = 338 + i * 78;
    fill(#35303C);
    textSize(15);
    text(kpopPeriods[i], 600, y);
    noStroke();
    fill(#EAE1E7);
    rect(600, y + 14, 300, 15, 8);
    fill(#A48DB8);
    rect(600, y + 14, total * 20, 15, 8);
    fill(#77707B);
    text(total, 912, y + 27);
  }

  stroke(#E1D7D8);
  line(55, 665, 945, 665);
  noStroke();
  fill(#77707B);
  textSize(14);
  text("Monday: " + countKpopDay("Monday") + " entries     Tuesday: " + countKpopDay("Tuesday") + " entries", 58, 699);
  text("I noticed I used TikTok most, and logged more activity in the afternoon.", 58, 726);
}

void drawKpopNote(int x, int y, int w, int h, String label, String value) {
  noStroke();
  fill(#FFFFFF);
  rect(x, y, w, h, 13);
  fill(#77707B);
  textSize(13);
  text(label, x + 18, y + 28);
  fill(#35303C);
  textSize(26);
  text(value, x + 18, y + 66);
}

int countKpopPlatform(String platform) {
  int count = 0;
  for (KpopEntry entry : kpopEntries) {
    if (entry.platform.equals(platform)) count++;
  }
  return count;
}

int countKpopPeriod(String period) {
  int count = 0;
  for (KpopEntry entry : kpopEntries) {
    if (entry.period.equals(period)) count++;
  }
  return count;
}

int countKpopDay(String day) {
  int count = 0;
  for (KpopEntry entry : kpopEntries) {
    if (entry.day.equals(day)) count++;
  }
  return count;
}

int getKpopTime() {
  int minutes = 0;
  for (KpopEntry entry : kpopEntries) minutes += entry.minutes;
  return minutes;
}

int getKpopRepeated() {
  int count = 0;
  for (KpopEntry entry : kpopEntries) {
    if (entry.repeated) count++;
  }
  return count;
}

void addKpopData() {
  // Each line: day, time of day, platform, time spent, repeated?
  kpopEntries.add(new KpopEntry("Monday", "Morning", "Spotify", 33, true));
  kpopEntries.add(new KpopEntry("Monday", "Morning", "TikTok", 12, false));
  kpopEntries.add(new KpopEntry("Monday", "Morning", "YouTube", 22, false));
  kpopEntries.add(new KpopEntry("Monday", "Morning", "Spotify", 27, true));
  kpopEntries.add(new KpopEntry("Monday", "Afternoon", "TikTok", 4, false));
  kpopEntries.add(new KpopEntry("Monday", "Afternoon", "Weverse", 20, false));
  kpopEntries.add(new KpopEntry("Monday", "Afternoon", "Instagram", 3, true));
  kpopEntries.add(new KpopEntry("Monday", "Afternoon", "Spotify", 47, true));
  kpopEntries.add(new KpopEntry("Monday", "Evening", "TikTok", 1, false));
  kpopEntries.add(new KpopEntry("Monday", "Late night", "TikTok", 12, true));
  kpopEntries.add(new KpopEntry("Monday", "Late night", "Instagram", 1, false));
  kpopEntries.add(new KpopEntry("Monday", "Late night", "TikTok", 24, true));
  kpopEntries.add(new KpopEntry("Tuesday", "Morning", "Spotify", 72, true));
  kpopEntries.add(new KpopEntry("Tuesday", "Morning", "TikTok", 3, true));
  kpopEntries.add(new KpopEntry("Tuesday", "Morning", "Instagram", 5, true));
  kpopEntries.add(new KpopEntry("Tuesday", "Afternoon", "Instagram", 2, false));
  kpopEntries.add(new KpopEntry("Tuesday", "Afternoon", "Weverse", 10, false));
  kpopEntries.add(new KpopEntry("Tuesday", "Afternoon", "TikTok", 5, false));
  kpopEntries.add(new KpopEntry("Tuesday", "Afternoon", "TikTok", 12, false));
  kpopEntries.add(new KpopEntry("Tuesday", "Afternoon", "Instagram", 4, true));
  kpopEntries.add(new KpopEntry("Tuesday", "Afternoon", "TikTok", 12, false));
  kpopEntries.add(new KpopEntry("Tuesday", "Afternoon", "Instagram", 2, true));
  kpopEntries.add(new KpopEntry("Tuesday", "Afternoon", "Spotify", 10, false));
  kpopEntries.add(new KpopEntry("Tuesday", "Evening", "Spotify", 21, true));
  kpopEntries.add(new KpopEntry("Tuesday", "Evening", "TikTok", 6, true));
}

class KpopEntry {
  String day;
  String period;
  String platform;
  int minutes;
  boolean repeated;

  KpopEntry(String newDay, String newPeriod, String newPlatform, int newMinutes, boolean wasRepeated) {
    day = newDay;
    period = newPeriod;
    platform = newPlatform;
    minutes = newMinutes;
    repeated = wasRepeated;
  }
}
