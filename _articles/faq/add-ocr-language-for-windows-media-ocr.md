---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I add more OCR languages for the Windows.Media.Ocr engine?
keywords: Dynamic Web TWAIN, Addon, OCR Connector, Windows.Media.Ocr, OCR language pack, Japanese, Chinese
breadcrumbText: How can I add more OCR languages for the Windows.Media.Ocr engine?
description: How can I add more OCR languages for the Windows.Media.Ocr engine used by OCR Connector?
date: 2026-10-28 00:00:00 +0000
last_modified: 2026-10-28 00:00:00 +0000
---

# Addon

## How can I add more OCR languages for the Windows.Media.Ocr engine?

The `Windows.Media.Ocr` engine used by [OCR Connector](/_articles/extended-usage/ocr.md){:target="_blank"} is the built-in OCR of Windows. It can only recognize languages whose **OCR language pack** is installed on the device. By default, Windows usually installs the OCR language pack only for the display language, so [`GetInstalledOCRInfo()`](/_articles/info/api/Addon_OCR.md#getinstalledocrinfo){:target="_blank"} may return only one language (e.g. `en-US`).

To recognize other languages, such as Japanese or Chinese, install the corresponding OCR language pack on the end-user's computer using either of the methods below. For the languages that `Windows.Media.Ocr` supports, see [Supported Languages Declared by Each Engine](/_articles/extended-usage/ocr.md#supported-languages-declared-by-each-engine){:target="_blank"}.

### Check the installed OCR languages

Open **Windows PowerShell** (not PowerShell 7) and run the following commands. Administrator privileges are not required.

```powershell
[Windows.Media.Ocr.OcrEngine, Windows.Foundation, ContentType = WindowsRuntime] | Out-Null
[Windows.Media.Ocr.OcrEngine]::AvailableRecognizerLanguages
```

The output lists the languages that `Windows.Media.Ocr` can currently use on this computer.

### Method 1: Add a language in Windows Settings

1. Open **Settings** and go to:
   - Windows 11: **Time & language** > **Language & region**
   - Windows 10: **Time & Language** > **Language**
2. Under **Preferred languages**, click **Add a language**.
3. Select the language you need (e.g. **Japanese** or **Chinese (Simplified, China)**) and click **Next**.
4. On the **Install language features** page, make sure **Optical character recognition** is listed. If you don't want to change the Windows display language, uncheck the display language option (e.g. **Set as my Windows display language**).
5. Click **Install** and wait for the installation to finish.

> Note:
>
> - If **Optical character recognition** is not listed for a language, Windows does not provide OCR for that language.
> - IT administrators can block users from installing languages through the `RestrictLanguagePacksAndFeaturesInstall` policy. In this case, use Method 2 or contact your IT administrator.

### Method 2: Install the OCR language pack with PowerShell

This method only installs the OCR language pack, without adding a display or input language.

1. Right-click **Windows PowerShell** and select **Run as administrator**.
2. List all OCR language packs and their states:

   ```powershell
   Get-WindowsCapability -Online | Where-Object { $_.Name -Like 'Language.OCR*' }
   ```

   Example output:

   ```
   Name  : Language.OCR~~~en-US~0.0.1.0
   State : Installed

   Name  : Language.OCR~~~ja-JP~0.0.1.0
   State : NotPresent
   ```

   `NotPresent` means the language pack is not installed yet. If a language is not in the list, Windows does not provide OCR for it.

3. Install the language pack you need. For example, to install Japanese (`ja-JP`):

   ```powershell
   $Capability = Get-WindowsCapability -Online | Where-Object { $_.Name -Like 'Language.OCR*ja-JP*' }
   $Capability | Add-WindowsCapability -Online
   ```

   Replace `ja-JP` with `zh-CN` for Simplified Chinese, `zh-TW` for Traditional Chinese, `ko-KR` for Korean, and so on. The installation may take several minutes.

To remove an OCR language pack, replace `Add-WindowsCapability` with `Remove-WindowsCapability` in the command above.

### After installation

Reload your web page and call `GetInstalledOCRInfo()` again. The new language should now be listed under the `Windows.Media.Ocr` engine. If it does not appear, restart the computer and try again.

> Note: If the OCR language pack is installed but still not available, and Windows is installed on a drive other than `C:` (e.g. `X:`), copy the `X:\Windows\OCR` folder to `C:\Windows\OCR`.

**References**

- [PowerToys Text Extractor - Install an OCR language pack](https://learn.microsoft.com/en-us/windows/powertoys/text-extractor#install-an-ocr-language-pack){:target="_blank"}
- [Language and region Features on Demand (FOD)](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-language-fod){:target="_blank"}
