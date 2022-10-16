# ShortLook API Reference

## Table of Contents

- [Contact Photo Provider](#contact-photo-provider)
- [Always-on Screen State Provider](#always-on-screen-state-provider)

---

# Contact Photo Provider

Use the [ShortLook](https://dynastic.co/shortlook) API to create plugins that provide contact icons for third-party applications to ShortLook.

- [Full Documentation](https://dynastic.github.io/ShortLook-API/)
- [API header](/ShortLook-API.h)
- [API template](https://www.github.com/dynastic/ShortLook-API-Template/)

## Quick Start

1. Setup your development environment just as you would to make tweaks, including Theos.
2. [Download the API template](https://www.github.com/dynastic/ShortLook-API-Template/archive/master.zip) and extract it's contents.
3. Rename your main class (DD_RENAMETHIS_ContactPhotoProvider).
4. Using the [Info.plist reference](#infoplist), change any values you may need to in `Info.plist`.
5. Implement your logic inside your main class's `contactPhotoPromiseOfferForNotification:` method ([details](#provider-classes)).
6. Configure your `Makefile` and `control` as you would a normal tweak, [using these tips](#metadata-tips).

## Photo Recommendations

- Any format supported by iOS.
- Around 1:1 in aspect ratio (or else it will be zoomed in).
- Above `152x152px` in size (`@3x`, preferably).

## Provider Structure and Explanation

Every provider plugin must have the following two things:

- An `Info.plist` file describing how ShortLook should register the provider: [Documentation](#infoplist) [Example](https://www.github.com/dynastic/ShortLook-API-Template/blob/master/Info.plist).
- An executable with (a) class(es) conforming to `DDNotificationContactPhotoProviding`: [Documentation](#provider-classes) [Example](https://www.github.com/dynastic/ShortLook-API-Template/blob/master/RENAMETHISContactPhotoProvider.m)

### Info.plist

The `Info.plist` file specifies to ShortLook how it should load and handle this provider plugin internally. Every Info.plist file should have the following keys:

- `CFBundleDisplayName`, **string**: A short name for what this plugin provides. In most cases, it should just be the name of the app you are providing for (e.g., Twitter).
- `DDNotificationExternalProviderClasses` **dictionary**: A dictionary of provider classes, and the bundle identifiers they provide for. The key should represent your class name, and it's value may be either a **string** or **array of strings** containing the bundle identifiers of apps to provide for.
- `DDNotificationExternalProviderAPIVersion` **integer**: *Must equal 1.* The ShortLook API version to use. This is to ensure that future updates with potentially breaking API changes do not crash ShortLook. These will be rare, if ever, but exists for future-proofing.

If you'd like to see a working version, check out an [example of Info.plist here](https://www.github.com/dynastic/ShortLook-API-Template/blob/master/Info.plist).

### Provider classes

Now that you've declared how ShortLook should load your plugin, you can start implementing the operations to receive contact photos.

You will make a class that inherits from `NSObject` and conforms to `DDNotificationContactPhotoProviding`. You should import `ShortLook-API.h` in your project for ease of use.

Each provider class implements the following method:

```objc
/// Returns an offer to fulfill a promise to provide a contact photo for a notification.
- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification;
```

If you'd like to see a working version, check out an [example of a provider class here](https://www.github.com/dynastic/ShortLook-API-Template/blob/master/RENAMETHISContactPhotoProvider.m).

> **Heads up!** Make sure your provider's class is unique (rename it if you used an example). In Objective-C, there may only have one class for a name. If any other classes exist with that name, your provider will crash the system.

#### Promises and Offers

When ShortLook asks you for a photo, you first return an object called an *Offer* (if you don't want to provide for a notification, return `nil`). This offer is simple: you provide the photo identifier, and then set a block that will be called if ShortLook needs your provider. A parameter on this block you set is an object called a *Promise*. While this promise doesn't directly contain your image at first, it eventually will be used to contain one by your provider. It is, in most basic terms, a *promise* to provide a contact photo. Since most provider's images will take a while to get (network requests, etc.), this is necessary to ensure optimal performance.

You initialize your offer with a **photo identifier**, which is a unique string for the contact photo you will provide, for internal use by ShortLook (such as caching, or choosing when to display the image). For the system contact photo provider, this identifier is the phone number or email address of the notification. For a provider like Twitter, it is the URL of the profile photo. For another social network, you may opt to use the photo's account's screen name, it that's more appropriate. Whatever your identifier be, just ensure it represents the photo you will return uniquely.

Once you have initialized your offer object, you can add a resolver using `fulfillWithBlock:`. The block you provide here should contain every next operation for grabbing the contact photo, such as network requests. Once you have received your image, pass it back to ShortLook by calling `resolveWithImage:` on your promise, which is a parameter of your block. If an error occurs and you are not able to fetch a contact photo for the user, call `reject` on the promise. Once you've resolved or rejected a promise, you may not do so it again, such as to change the image.

The promise object also features many properties, such as `usesCaching` and `backgroundColor`, which can be set at any time before the promise is completed.

##### What if I can get my image instantly?

If your image is returned instantly, rather than by using a network request, you can use a convenience method on `DDNotificationContactPhotoPromiseOffer`, named `offerInstantlyResolvingPromiseWithPhotoIdentifier:image:`. Just return the generated promise from your provider. Choose wisely, though. This method should only be used if you can get your image absolutely instantly. If you take too long using this synchronous method, ShortLook may penalize your provider.

## Metadata Tips

- Your package should usually be called something like "APP Photo Provider for ShortLook" in Cydia.
- It is recommended you make your bundle name something like "ShortLook-APP".

## Full Documentation

You can view the full class documentation for ShortLook's photo provider API [here](https://dynastic.github.io/ShortLook-API/).

## Examples

You can look at the following open source provider examples to get an idea of how to use the ShortLook API:

- [Blank Template](https://www.github.com/dynastic/ShortLook-API-Template/)
- [Twitter](https://www.github.com/dynastic/ShortLook-Twitter/)

---

# Always-on Screen State Provider

Starting in version 1.0.2, ShortLook provides an external coordination API for non-Dynastic tweaks to use. It will allow these tweaks to provide the screen’s display on state, since some tweaks fake the screen being off on OLED phones.

If your tweak keeps the screen on while the user would expect it to be off, ShortLook can obey this preference and behave like the screen is off.

First, implement the following provider in a class where you wish to provide this information:

```objc
@protocol DDLunarScreenStateProvider <NSObject>
@required
/// If your tweak keeps the screen awake to provide an always-on experience but should act to Lunar like the display is off, return whether you want the screen to be treated as on or off here. If any single provider is returning NO for this, the screen will be treated as such.
- (BOOL)isScreenOn;
@end
```

Once you have implemented that, you must register an instance of this class using `DDLunarScreenStateManager`. You can call `registerScreenStateProvider:` on the shared manager to tell ShortLook to ask your provider before deciding how to treat the screen state, using the following header:

```objc
@interface DDLunarScreenStateManager: NSObject
+ (instancetype)sharedManager;
- (void)registerScreenStateProvider:(NSObject<DDLunarScreenStateProvider> *)provider;
- (void)deregisterScreenStateProvider:(NSObject<DDLunarScreenStateProvider> *)provider;
@end
```

**Do not check for the presence of ShortLook by checking the filesystem or other classes.** You can directly check that `DDLunarScreenStateManager` exists. ShortLook will hold a strong reference to your screen state provider until it is deregistered.

```objc
if (NSClassFromString(@"DDLunarScreenStateManager")) {
    MyScreenStateProvider *provider = [MyScreenStateProvider new];
    [[%c(DDLunarScreenStateManager) sharedManager] registerScreenStateProvider:provider];
}
```
