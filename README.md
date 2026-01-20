# NikkeLinux

A guide and automation script to get **Goddess of Victory: NIKKE** running on Linux. This method uses a "Lottery" script to bypass the Anti-Cheat race condition that prevents the launcher from opening.

## 🛠 How to Install

1.  **Install Steam:** Make sure Steam is installed for your distro (Steam is required for the Anti-Cheat to initialize).
2.  **Download MiniLoader:** Get `NikkeMiniloader0.0.6.143.exe` from this repo or https://nikke-en.com/NikkeMiniloader0.0.6.143.exe or https://web.archive.org/web/20230215142046/https://nikke-en.com/NikkeMiniloader0.0.6.143.exe
3.  **Proton Setup:** Use **ProtonPlus** to install **ProtonGE 10-25** or newer (latest is recommended; 10-28 was used during testing). Restart Steam after installing.
4.  **Add to Steam:** Add `NikkeMiniloader0.0.6.143.exe` as a **Non-Steam Game**. Set the compatibility to the ProtonGE version you downloaded.
5.  **Initial Install:** Launch the game through Steam and install it to `C:\NIKKE`.
6.  **Locate the Prefix:** Go to `~/.steam/steam/steamapps/compatdata/`, sort by date, and open the most recent folder (e.g., `3788235738`).
7.  **Find the Launcher:** Navigate to `pfx/drive_c/NIKKE/Launcher/nikke_launcher.exe`.
8.  **Update Steam Target:** Right-click the `.exe`, copy the full path, and paste it into the **Target** field of your Non-Steam game entry in Steam. You can now rename the entry to "Goddess of Victory: NIKKE".
9.  **Get AppID:** Create a desktop shortcut from the Steam entry. Open the shortcut in a text editor to find your ID (e.g., `steam://rungameid/16270348604281978880`).
10. **Prepare Script:** Download `nikke_lotery.sh`, open it, and change `APP_ID` to your specific ID.
11. **Run:** 
    ```bash
    chmod +x nikke_lotery.sh
    ./nikke_lotery.sh
    ```
12. **Login:** Once the launcher finally opens, select **"Other Logins"** and sign in as you would on Windows.

## 🔍 Why This Works (The "How and Why")
It appears the developers may have worked on Steam/Steam Deck support at some point, as the launcher mentions "Steam Quick Login" when it successfully opens. However, it isn't finalized, and a race condition in the Anti-Cheat usually causes the launcher to hang silently.

**The "Lottery" Logic:**
Opening and closing the game repeatedly (usually 2-4 times) eventually allows the Anti-Cheat to handshake correctly. This script automates that "lottery" by checking process counts and retrying until the launcher successfully appears.

## 🔧 Troubleshooting

* **Launcher won't open:** If the game doesn't open within 2-4 tries, try increasing the `sleep` time inside the script.
* **Stuck at 0% Update:** If there is a launcher update and it hangs at `0% 0MB/s`, change the Steam **Target** back to the `NikkeMiniloader0.0.6.143.exe` and "re-install" to the same `C:\NIKKE` location. The old Miniloader handles downloads/updates better on Linux than the modern installer.

---
**Credits:** Discovery and Testing by **koleq**<br>Automation script and Readme formatting by **Gemini 3.5 Flash**.
