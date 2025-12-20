# 📱 Manual Testing Guide for Rain App - Indian Languages

## 🔧 Pre-Testing Setup

### Fix Android Build Tools Issue
If you encounter "Could not locate aapt" error:

```bash
# Option 1: Update Android SDK Build Tools
# Open Android Studio > SDK Manager > SDK Tools
# Install/Update "Android SDK Build-Tools"

# Option 2: Set ANDROID_HOME environment variable
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0

# Option 3: Reinstall Flutter
flutter doctor --android-licenses
flutter doctor -v
```

### Build and Install the App

```bash
# Clean previous builds
flutter clean

# Get dependencies
flutter pub get

# Build APK for testing
flutter build apk --debug

# Install on connected device
flutter install -d def93dee

# OR run directly
flutter run -d def93dee
```

## 🧪 Testing Procedure

### Step 1: Launch the App
1. Open the Rain app on your device
2. Complete onboarding if it's first launch
3. Navigate to Settings

### Step 2: Test Indian Languages

#### Test Each Language:
For **each** of the following languages, perform these checks:

**Indian Languages to Test:**
1. हिन्दी (Hindi)
2. বাংলা (Bengali)
3. తెలుగు (Telugu)
4. मराठी (Marathi)
5. தமிழ் (Tamil)
6. ગુજરાતી (Gujarati)
7. ಕನ್ನಡ (Kannada)
8. മലയാളം (Malayalam)
9. ଓଡ଼ିଆ (Odia)
10. ਪੰਜਾਬੀ (Punjabi)
11. অসমীয়া (Assamese)

**For Each Language:**

✅ **Language Selection**
- Go to Settings → Language
- Select the language
- Verify language name appears in native script
- Check if app restarts/updates immediately

✅ **Main Screen**
- Weather information displays in selected language
- Temperature units show correctly
- Weather conditions (sunny, rainy, etc.) are translated
- Time/date format is appropriate

✅ **Settings Menu**
- All menu items translated
- No English text visible
- Settings options work correctly
- Can navigate back to language selection

✅ **Weather Details**
- Hourly forecast shows translated labels
- Daily forecast displays correctly
- Weather parameters (humidity, wind, etc.) translated
- Units (km/h, °C, etc.) display properly

✅ **City Search**
- Search functionality works
- City names display appropriately
- Can add/remove cities
- Location services work

✅ **Visual Check**
- Text doesn't overflow containers
- UI elements align properly
- Font renders clearly
- No boxes or question marks instead of text

### Step 3: Test RTL Languages

**RTL Languages to Test:**
1. العربية (Arabic)
2. עברית (Hebrew)

**For Each RTL Language:**

✅ **Text Direction**
- Text flows from right to left
- UI layout mirrors appropriately
- Back button on correct side
- Menu items align to right

✅ **Functionality**
- All features work in RTL mode
- Navigation is intuitive
- Buttons respond correctly
- No layout issues

### Step 4: Language Switching Test

1. Start with English
2. Switch to Hindi → Verify works
3. Switch to Tamil → Verify works
4. Switch to Arabic → Verify RTL works
5. Switch to Gujarati → Verify works
6. Switch back to English → Verify works

**Check:**
- No crashes during switches
- App remembers last selected language
- UI updates immediately
- No performance degradation

### Step 5: Performance Test

✅ **App Performance**
- App starts quickly
- Smooth scrolling in all languages
- No lag when switching languages
- Weather data loads properly
- No memory issues

✅ **Edge Cases**
- Long city names don't break UI
- Special characters display correctly
- Numbers format appropriately
- Error messages in selected language

## 📸 Screenshot Checklist

Take screenshots of:
1. Language selection menu showing all Indian languages
2. Main weather screen in Hindi
3. Main weather screen in Tamil (different script)
4. Main weather screen in Arabic (RTL)
5. Settings menu in Gujarati
6. Weather details in Telugu
7. Any issues or bugs found

## 🐛 Bug Reporting Template

If you find any issues, document them:

```
**Language:** [e.g., Tamil]
**Issue:** [Brief description]
**Steps to Reproduce:**
1. 
2. 
3. 

**Expected Behavior:**
**Actual Behavior:**
**Screenshot:** [If applicable]
**Device:** CPH2691 (Android 15)
```

## ✅ Success Criteria

Before creating PR, ensure:
- [ ] All 11 Indian languages display correctly
- [ ] Both RTL languages work properly
- [ ] No crashes or freezes
- [ ] Language switching is smooth
- [ ] All weather features functional
- [ ] UI looks good in all languages
- [ ] Performance is acceptable
- [ ] No critical bugs found

## 🚀 Ready for PR When

- All tests pass
- Screenshots taken
- No critical bugs
- Performance acceptable
- Documentation updated

## 💡 Quick Test (Minimum)

If time is limited, test at least:
1. Hindi (most speakers)
2. Tamil (different script)
3. Arabic (RTL)
4. One more Indian language of your choice

This covers:
- Devanagari script
- Dravidian script
- RTL functionality
- General translation quality

## 📝 Notes

- Testing on real device is crucial for font rendering
- Some scripts may look different on different Android versions
- RTL testing is especially important for UI layout
- Performance testing helps identify memory leaks

Good luck with testing! 🎉