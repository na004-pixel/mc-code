# Troubleshoot: "Application Blocked by Java Security"

If a local Java desktop app (`.jar`, `.jnlp`, launcher, etc.) refuses to start and shows:

> Application blocked by Java security  
> Application blocked by security settings

try this:

---

## 1. Open Java Control Panel

Windows:
- Start Menu
- Search:
```text
  Configure Java
```

or:

* Control Panel → Java

---

## 2. Add the App Folder to Java Exception Site List

Inside Java Control Panel:

```text
Security → Edit Site List → Add
```

Add the local app path using THIS format:

```text
file:///C:/Path/To/App/
```

Example:

```text
file:///D:/Games/OldJavaApp/
```

IMPORTANT:

* use `file:///`
* use `/` forward slashes
* NOT:

  ```text
  C:\Path\To\App
  ```

You can also add the exact `.jar` file:

```text
file:///D:/Games/OldJavaApp/app.jar
```

---

## 3. Try "Unblock" in Windows

Right click the `.jar` or launcher file:

```text
Properties → Unblock → Apply
```

(if the checkbox exists)
