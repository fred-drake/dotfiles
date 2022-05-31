#!/usr/bin/osascript
ObjC.import('stdlib')
var BW_EXEC = $.getenv('BW_EXEC');
var PATH = $.getenv('PATH');
var USE_APIKEY = $.getenv('USE_APIKEY');

function run(arg) {

    var app = Application.currentApplication()
    app.includeStandardAdditions = true

    var mode = arg[0]
    var modeSet = "unlock"
    var email = arg[1]
    if (mode.localeCompare(modeSet) == 0) {
        return unlock(email)
    } else {
        var totpInt = arg[2]
        var totpStr = arg[3]
        if(totpStr == null){
            totpStr = " "
        }

        // Take this road if API KEY is used
        if (USE_APIKEY.localeCompare("true") == 0) {
            var text_id = `Login to Bitwarden for user ${email} with API KEY.\nPlease enter your client_id:`
            var client_id = app.displayDialog(text_id, {
                defaultAnswer: "",
                withIcon: "caution",
                buttons: ["Cancel", "OK"],
                defaultButton: "OK",
                cancelButton: "Cancel",
                givingUpAfter: 120,
                hiddenAnswer: "true"
            })
            var text_secret = `Login to Bitwarden for user ${email} with API KEY.\nPlease enter your client_secret:`
            var client_secret = app.displayDialog(text_secret, {
                defaultAnswer: "",
                withIcon: "caution",
                buttons: ["Cancel", "OK"],
                defaultButton: "OK",
                cancelButton: "Cancel",
                givingUpAfter: 120,
                hiddenAnswer: "true"
            })
            $.setenv('BW_CLIENTID', client_id.textReturned, 1);
            $.setenv('BW_CLIENTSECRET', client_secret.textReturned, 1);
            login(email, totpCode, totpInt)
            return unlock(email)
        } else {
            var text = `Login to Bitwarden for user ${email}.\nPlease enter your password:`
            var response = app.displayDialog(text, {
                defaultAnswer: "",
                withIcon: "caution",
                buttons: ["Cancel", "OK"],
                defaultButton: "OK",
                cancelButton: "Cancel",
                givingUpAfter: 120,
                hiddenAnswer: "true"
            })
            $.setenv('PASS', response.textReturned, 1);

            if (totpStr.localeCompare(" ") != 0) {
                if (totpInt.localeCompare("1") != 0) {
                    var text = `2FA authentication for Bitwarden user ${email}.\nPlease enter your 2FA code for ${totpStr}:`
                    var response = app.displayDialog(text, {
                        defaultAnswer: "",
                        withIcon: "caution",
                        buttons: ["Cancel", "OK"],
                        defaultButton: "OK",
                        cancelButton: "Cancel",
                        givingUpAfter: 120,
                        hiddenAnswer: "false"
                    })

                    var totpCode = response.textReturned
                    return login(email, totpCode, totpInt)
                } else {
                    return login(email, "", totpInt)
                }
            } else {
                return login(email, "", "")
            }
        }
    }
}

function login(email, totp, totpMode) {
    var app = Application.currentApplication()
    app.includeStandardAdditions = true


    // check if we use APIKEY
    if (USE_APIKEY.localeCompare("true") == 0) {
        var cmd = `PATH=${PATH}; ${BW_EXEC} login --apikey`
        try {
            var result = app.doShellScript(cmd);
            $.unsetenv('PASS');
            $.unsetenv('BW_CLIENTSECRET');
            $.unsetenv('BW_CLIENTID');
        } catch (e) {
            $.unsetenv('PASS');
            $.unsetenv('BW_CLIENTSECRET');
            $.unsetenv('BW_CLIENTID');
            console.log(e.toString())
            return e.toString()
        }
        console.log("Logged in.")
    } else {
        // email login mode
        if (totpMode.localeCompare("1") == 0) {
            var cmd = `PATH=${PATH}; ${BW_EXEC} login ${email} --method ${totpMode} --passwordenv PASS`
            try {
                var result = app.doShellScript(cmd);
            } catch (e) {
                $.unsetenv('PASS');
                var res = e.toString()
                res = res.includes("Two-step login code")
                if (!res) {
                    console.log(e.toString())
                    return e.toString()
                }
            }
            var text = `Email authentication for Bitwarden user ${email}.\nPlease enter your 2FA code sent via email:`
            var response = app.displayDialog(text, {
                defaultAnswer: "",
                withIcon: "caution",
                buttons: ["Cancel", "OK"],
                defaultButton: "OK",
                cancelButton: "Cancel",
                givingUpAfter: 120,
                hiddenAnswer: "false"
            })
            var totpCode = response.textReturned

            var cmd = `PATH=${PATH}; ${BW_EXEC} login ${email} --method ${totpMode} --code ${totpCode} --passwordenv PASS --raw`
            try {
                var result = app.doShellScript(cmd);
                $.unsetenv('PASS');
            } catch (e) {
                $.unsetenv('PASS');
                console.log(e.toString())
                return e.toString()
            }
        } else {
            if (totp.localeCompare("") != 0) {
                var cmd = `PATH=${PATH}; ${BW_EXEC} login ${email} --method ${totpMode} --code ${totp} --passwordenv PASS --raw`
            } else {
                var cmd = `PATH=${PATH}; ${BW_EXEC} login ${email} --passwordenv PASS --raw`
            }
            try {
                var result = app.doShellScript(cmd);
                $.unsetenv('PASS');
            } catch (e) {
                $.unsetenv('PASS');
                console.log(e.toString())
                return e.toString()
            }
        }
    }
    // should have been unset before but just to be sure repeat it here
    $.unsetenv('PASS');
    $.unsetenv('BW_CLIENTSECRET');
    $.unsetenv('BW_CLIENTID');
    // token is not available with apikey only after unlock
    if (USE_APIKEY.localeCompare("true") != 0) {
        var res = setToken(result)
        if (res.localeCompare("") == 0) {
            return "Logged in."
        }
    }
}

function unlock(email) {
    var app = Application.currentApplication()
    app.includeStandardAdditions = true

    var text_unlock = `Unlock Bitwarden for user ${email}.\nPlease enter your password:`
    var response = app.displayDialog(text_unlock, {
        defaultAnswer: "",
        withIcon: "caution",
        buttons: ["Cancel", "OK"],
        defaultButton: "OK",
        cancelButton: "Cancel",
        givingUpAfter: 120,
        hiddenAnswer: "true"
    })
    $.setenv('PASS',response.textReturned, 1);

    var cmd = `PATH=${PATH}; ${BW_EXEC} unlock --passwordenv PASS --raw`
    try {
        var result = app.doShellScript(cmd);
        $.unsetenv('PASS');
        var res = setToken(result)
        if (res.localeCompare("") == 0) {
            return "Unlocked"
        }
    }catch(e) {
        $.unsetenv('PASS');
        console.log(e)
        return e.toString()
    }
}

function setToken(token) {
    var bundleId = "com.lisowski-development.alfred.bitwarden"
    var app = Application.currentApplication()
    app.includeStandardAdditions = true

    var cmd = `/usr/bin/security add-generic-password -s ${bundleId} -a token -w ${token} -U`
    try {
        app.doShellScript(cmd);
        return ""
    }catch(e) {
        console.log(e.toString())
        return e.toString()
    }
}
