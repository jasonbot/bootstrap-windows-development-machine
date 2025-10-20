# Bootstrap a Windows Machine for Development

A very opinionated set of scripts to get a Windows 11 machine up and running from zero

Open a Powershell admin terminal and do this:

## Average Case One-Shot

```powershell
Set-ExecutionPolicy Bypass
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/jasonbot/bootstrap-windows-development-machine/refs/heads/main/bootstrap.ps1")))
```

## You Work With Me _On An Employer-Provisioned Machine_

```powershell
Set-ExecutionPolicy Bypass
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/jasonbot/bootstrap-windows-development-machine/refs/heads/main/bootstrap.ps1"))) -IWorkHere
```

## Installing on a VM

```powershell
Set-ExecutionPolicy Bypass
& ([scriptblock]::Create((irm "https://raw.githubusercontent.com/jasonbot/bootstrap-windows-development-machine/refs/heads/main/bootstrap.ps1"))) -ThisIsAVM
```

# Flags

There are two flags you can send along!

## `-IWorkHere`

If you are my coworker, this installs some more work-related software.

## `-ThisIsAVM`

If you are bootstrapping a Virtual Machine or do not wish to enable virtualization tools.

This repo uses [Win11Debloat](https://github.com/Raphire/Win11Debloat) for some of its functionality.
