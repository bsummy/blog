For 90% of readers on this site, this will be a pretty boring post. Read on if you'd like, but be warned...

## Context

During a layover in LGA last fall, I was coding on my laptop when a young father started chatting with me about programming. I don't recall exactly how we got on the topic, but eventually we came around to talking about Flutter.


## Flutter
For those unaware, most frontend development is written in effectively three parts:
    - JavaScript: any mechanics, function calls, etc.
    - React/HTML: the structure/template of the webpage, which can depend on the data passed in.
    - CSS: the styling of the webpage, meaning small tweaks to the look of objects.

Flutter is written in the dart programming language, and effectively is only written in one part. With styling, functions, and widget calls all in one file, it requires significant nesting to keep code readable. However, this lends itself to easy development and a neat codebase. Having flutter's refactor tool and a prettier extension mapped to easy keyboard shortcuts also helped.

When I first began working on this project, I thought that flutter was an exponential improvement in development time & ease of use from React. As I spent more time on it, I'm not sure that's true. I like it better than React, but I'm not sure if it's an order of magnitude better.

## Website structure

The website is completely custom and purpose built. I wasn't following any tutorials, just learning on the fly and piecing things together. Flutter has really strong documentation, meaning that AI tools were also pretty well suited to help me. I used a combination of Gemini and Copilot for auto-complete, basic widget layouts, and niche questions.

Each album on screen corresponds to a blog post in the assets folder. There, I have sub-directories for cover art, photos on the photo carousel, and a markdown file with the blog text. I use provider state management to tell what album is playing, and what blog post should be rendered.

## My finest moment

Believe it or not, but the most difficult part of this project was the transition where the vinyl pops out of the back of the record. For whatever reason that was the transition in my head, and even after learning that it wasn't in-built in flutter, I had to make it anyway.

I probably tried 10-15 distinct approaches that either ended up not looking right, or not working right. The final solution required an animation controller, stack swapping, and a bit of luck. I'm very proud of the way it looks, and the code itself even looks elegant!

The web app would be roughly the same without the transition, but I am very proud of it. The first time it worked, I proceeded to host an impromptu solo dance party while clicking at random to watch my creation over and over.

## What's next

Given the aforementioned busy year I have, I'm not sure how much time I'll invest in writing new features for this app. My spare coding time will likely go back towards working on PierreAnalytics. However, if I can get around to it, I'll like to learn how to do Authentication & SSO. That way, I can provision accounts, and also build a permissions/locking admin feature to tune blog posts to the people that understand them.

P.S. there's not really any fun pictures that will go with this blog post, so I'll put in some from Henry's total solar eclipse film roll.
