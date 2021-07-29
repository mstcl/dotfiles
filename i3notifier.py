# :.config/i3/i3_notifier_config.py

import subprocess
import time

from i3notifier.config import Config
from i3notifier.utils import RunAsyncFactory


class DefaultConfig(Config):
    pre_action_hooks = [
        # Start a script to listen for urgent workspaces & switch to it
        RunAsyncFactory(lambda n: subprocess.call("switch-to-urgent.py")),
        # Wait for the script become available
        lambda n: time.sleep(0.2),
    ]


def ChromeAppFactory(title, url, icon=None, second_key="body"):
    kChrome = "Brave"
    lURL = len(url)
    icon = icon

    class ChromeApp(DefaultConfig):
        def should_apply(notification):
            return (
                notification.body.startswith(url) and notification.app_name == kChrome
            )

        def update_notification(notification):
            notification.body = notification.body[lURL:].strip()
            notification.app_name = title
            #notification.app_icon = icon

        def get_keys(notification):
            return title, str(getattr(notification, second_key))

    return ChromeApp

def Spotify(title, icon=None, second_key="body"):
    kSpotify = "Spotify"
    icon = icon or "Spotify"

    class SpotifyApp(DefaultConfig):
        def should_apply(notification):
            return (
                notification.app_name == kSpotify
            )

        def update_notification(notification):
            notification.app_name = title
            notification.app_icon = icon

    return SpotifyApp

def Discord(title, icon=None):
    kDiscord = "discord"
    icon = icon or "discord"
    class DiscordApp(DefaultConfig):
        def should_apply(notification):
            return (
                notification.app_name == kDiscord
            )

        def update_notification(notification):
            notification.app_name = title
            notification.app_icon = icon

    return DiscordApp


config_list = [
    ChromeAppFactory("Discord", "discord.com"),
    ChromeAppFactory("WhatsApp", "web.whatsapp.com"),
    Spotify("Spotify"),
    Discord("Discord"),
    DefaultConfig,
]


theme = "i3-notifier"
