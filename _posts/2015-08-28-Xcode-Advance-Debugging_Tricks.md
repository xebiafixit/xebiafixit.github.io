---
layout: post
author: Nitin Gupta
username: NitinGuptaXebia
description: This blog will enhance your in hand experience about most advance tricks for Debugging Xcode Projects. Required Xcode 6.0 Or above.
created: 2015/08/28
created_gmt: 2015/08/28
comment_status: open
tag:
- iOS
- Xcode
- iPhone
- Advance debugging tricks
---

# Xcode Advance Debugging Technique
This blog will enhance your in hand experience about most advance tricks for Debugging Xcode Projects. Required Xcode 6.0 Or above.

# Table of content
  * [Introduction](#Introduction)
  * [NSZombie](#NSZombie)
  * [Crash](#Crash)
  * [Crazy Trick](#Crazy-Trick)
  * [More Advance Trick](#More-Advance-Trick)

<a id="Introduction"></a>


## Introduction
I believe we are having a lot of fun on regular basis with scheduled iOS programming. This can also be  more interesting by adding more ways to Advance debugging technique.

Often we were working with conventional ways to debug our code using Xcode. However we didn’t  reached to any Advance technique in Xcode (Objective-C & Swift).I recently ran into a very tricky exception toward the tail end of a long fruitful day of programming for my project.  The only clue that I was given that there was any problem whatsoever was seeing the following statement where the program halted since I have a global breakpoint set up to halt on all exceptions:

EXC_BAD_ACCESS

That’s not exactly the most inviting error to debug.  Needless to say I wasn’t entirely clear how to even extract more hints as to what was going on since I already output all of the exception details when they’re thrown (in this case there were none).  Additionally the stack trace was blank past the entry point to the application delegate – equally puzzling.  After some digging around on this vague exception, the conclusion being drawn was one of only two likely possibilities:

Accessing something uninitialized

Accessing something already released by ARC (memory garbage collection essentially).
I felt above listed is a more common scenario.  Given that, I did some additional digging and stumbled upon a sneaky area within Xcode 6 project configurations that enables developers to squeeze more information out of the debugger in these scenarios.

<a id="NSZombie"></a>


## NSZombie
Xcode 6 Memory Management Zombie ObjectsNavigate to the following area in your project: Product -> Scheme -> Edit Scheme -> Run Debug Section -> Diagnostics Section -> (Check) Enable Zombie Objects.

![Image][NSZombie_image]

The zombie objects are basically a memory debugging tool we can take advantage of during development.  For more information, please check out Apple Documentation, as it gives a great explanation. This is one of the advance trick we are using so far.

However, Over the long time and by exploring many ways to find out Advance Debugging Technique, This have been reached to another advancement pinnacle with [WWDC15 Session][SessionLink].
There is super cool ad-ons to debugging trick i have worked so far.
<a id="Crash"></a>


## Crash
To write it down this blog, I have created a sample Project having around Few types of different crashes that is horrible to identify, Moreover developer dread to way and dig more in order to pin nail.

**Sample Code** [Download][Code_link]

![Image][Crash]

At a first look on real issues/errors, Click on the objc_exception_throw in your Thread as shown above.

Yeah, As it realize that, this is all baffle. It’s more complex to understand and deal with.
<a id="Crazy-Trick"></a>


## Crazy Trick
However this is where from the fun part starts. Simply go to your Debug console section and Type “po $arg1” and Press Enter. Wow you got something that is human readable version of error.
“po $arg1” brief the Error/Exception first argument and that is what we were alway looking at. This details ways to an easy solutions.

![Image][Crash_Details]
<a id="More-Advance-Trick"></a>


# More Advance Trick
We can also add the **“po $arg1”** command to our Exception Break point, So it would be like Automated debug log behavior for all exceptions.

**Steps :**
1.Go to breakpoint Navigation.
2.Create a breakpoint (+) at bottom left.
3.Add Exception Break Point.
4.Right Click on (All Exceptions) Breakpoint .
5.Edit Breakpoint.
6.Add Action.
7.add **“po $arg1”**.

![Insert_image][Add_Exception_BreakPoint]


Run your code and Yeah that’s an easiest way to fix.

Have fun with debugging and deal with crashes.

You could also add few more action like : po $eax . That tells more about line causing exception and reason of exception.


[Code_link]:https://github.com/NitinGuptaXebia/BlogsSampleCode.git
[SessionLink]:https://developer.apple.com/videos/wwdc/2015/?id=413
[NSZombie_image]: /img/XcodeAdvanceDebugging/NSZombie.png
[Crash]: /img/XcodeAdvanceDebugging/Crash.png
[Crash_Details]: /img/XcodeAdvanceDebugging/Crash_Details.png
[Add_Exception_BreakPoint]: /img/XcodeAdvanceDebugging/Add_Exception_BreakPoint.png
