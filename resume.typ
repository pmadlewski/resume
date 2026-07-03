#import "@preview/vivid-cv:0.1.1": *

// ── Color palette ─────────────────────────────────────────────
#let color-name    = "#ECF0F1"   // name in banner
#let color-heading = "#208088"   // section titles
#let color-dark    = "#2C3E50"   // banner bg, separators, body text
#let color-light   = "#ECF0F1"   // banner text, page background

// ── Spacing knobs ─────────────────────────────────────────────
// Extra gap injected above the "About Me" heading (between the banner and
// About Me). Grows the About Me heading box downward, pushing everything
// below slightly lower. Set to 0pt to disable; typical range 5pt–30pt.
#let banner-about-gap = 10pt

// Page background (main section)
#set page(fill: rgb(color-light))

// Local override: the built-in `extracurriculars` wraps the whole activity in
// `strong()`, which makes everything bold. We want to control bolding manually
// via `*...*` inside the activity content, so re-implement without `strong()`.
#let extracurriculars(activity: "", dates: "") = grid(
  columns: (1fr, auto),
  align: (left + top, right + top),
  activity,
  dates,
)

// Custom work() that underlines the title and company for stronger
// visual separation between jobs. Shadows the vivid-cv default.
//
// The v(18pt) is added ONLY between siblings, not before the first work()
// in a section — state tracks whether we've already seen a work() since
// the last heading. The heading show rule below resets it.
#let seen-work = state("seen-work", false)

#let work(title: "", dates: "", company: "", location: "") = {
  context if seen-work.get() {
    v(18pt, weak: true)
  }
  seen-work.update(true)
  stack(
    dir: ttb,
    spacing: 7pt,
    grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      underline(stroke: 0.6pt + rgb(color-dark), offset: 3pt)[#strong(title)],
      dates,
    ),
    grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      underline(stroke: 0.4pt + rgb("#999999"), offset: 3pt)[#company],
      emph(location),
    ),
  )
}

#show: resume.with(
  author: "Paweł Madlewski",
  title: "Senior Data Analyst & Analytics Engineer",
  location: "Kraków, Poland",
  email: "pmadlewski@gmail.com",
  phone: "+48 698 643 610",
  linkedin: "pmadlewski",

  // Prepending `v(...)` to the heading body grows the heading box downward,
  // pushing the whole About Me section (and everything below it) slightly lower
  // beneath the banner while preserving the template's photo-wrap layout.
  // Tune the gap via `banner-about-gap` at the top of the file.
  about-title: [#v(banner-about-gap) About Me],
  about-beside: [
    Senior data analyst / analytics engineer with 7+ years of experience across
    SaaS startups, investment banking and high-volume B2C platforms. I lead end-to-end
    analytics initiatives — from ELT design and dbt modeling, through defining measurement
    frameworks to building custom and flexible dashboards — partnering with teams across
    the business including product, marketing and finance.
  ],

  // Save a square headshot as `photo.jpg` in this folder.
  show-photo: false,
  photo: image("photo.jpg", width: 100%, height: 100%, fit: "cover"),
  photo-size: 140pt,

  header-color: color-dark,      // banner background
  name-color: color-name,        // name in banner
  heading-color: color-heading,  // section titles ("Work Experience", etc.)
  text-color: color-dark,        // body text
  photo-border: color-light,     // photo ring matches page bg
  lang: "en",
)

// Override section header underline to use dark navy, and reset the
// `seen-work` flag so the first job in each Work Experience section
// snaps close to the heading (subsequent jobs keep their 18pt gap).
#show heading.where(level: 2): it => {
  seen-work.update(false)
  v(24pt, weak: true)
  [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt + rgb(color-dark))
  ]
}


== Work Experience

#work(
  title: "Senior Data Analyst",
  company: "Scrive",
  location: "Remote",
  dates: dates-helper(start-date: "Jul 2025", end-date: "Present"),
)
- Build and evolve data models in *dbt* on top of *Snowflake*, powering product, revenue and marketing analytics for the combined org
- Led selection and roll-out of a self-hosted *Metabase* instance as the merged organisation's BI platform
- Led the analytics side of the *HubSpot* → *Salesforce* CRM migration: rewrote affected *dbt* models and built a *reverse-ETL* from *BigQuery* to *Salesforce* to surface product-usage signals to Sales and automatically create leads
- Ran product analytics workshops with PMs ahead of a major platform relaunch to help define user journeys and success metrics. Designed an end-to-end measurement framework for the project

#work(
  title: "Senior Data Analyst",
  company: "Contractbook",
  location: "Remote",
  dates: dates-helper(start-date: "Jun 2022", end-date: "Jul 2025"),
)
- *Led analytics for Product-Led Growth* — defined key metrics, built end-to-end funnel dashboards combining marketing attribution with in-product usage data, and designed usage metrics predicting conversion
- *Designed and shipped an in-house ELT pipeline* in *Python* + *Airflow* on *Google Kubernetes Engine*, replacing a third-party ETL tool — syncs ~60 production *PostgreSQL* tables (up to 100M rows) into *BigQuery*
- Built and maintained *dbt* data models on top of *BigQuery*, powering analytics and BI datasets across marketing, finance, product and operations
- Built and maintained flexible dashboards in *Metabase*
- Consulted business stakeholders on data collection best practices, marketing attribution, and CRM data (*Hubspot* / *Salesforce*)

#work(
  title: "Business Intelligence Analyst",
  company: "Lottomart",
  location: "Remote",
  dates: dates-helper(start-date: "Oct 2020", end-date: "May 2022"),
)
- Collaborated closely with various business stakeholders (marketing, finance, product, operations) to scope and build end to end automated reporting solutions
- Developed data warehouse in *Google BigQuery* using scheduled stored procedures and views
- Developed and scheduled *Python* scripts supplementary to the data warehouse (e.g. streaming results of network analysis to BigQuery)
- Created interactive dashboards using *PowerBI* and *Looker Studio*

#work(
  title: "Data Analyst",
  company: "UBS Group AG",
  location: "Kraków, Poland",
  dates: dates-helper(start-date: "Feb 2019", end-date: "Sep 2020"),
)
- Conducted research on alternative data to support investment decisions
- Developed tools in *Python* for data gathering and process automation
- Ensured quality of data and transformed it into insightful form


== Side Projects

#work(
  title: "Fractional CMO",
  company: "SaunyPro (saunypro.pl)",
  location: "Kraków, Poland",
  dates: dates-helper(start-date: "Jun 2024", end-date: "Present"),
)
- Founded a custom sauna brand — built the brand identity, visual system and website from scratch
- Run paid acquisition (Google Ads) that drives a consistent stream of customers and revenue
- End-to-end ownership: brand, web, marketing strategy and analytics

#work(
  title: "Co-founder",
  company: "Simplify Docs",
  location: "Kraków, Poland",
  dates: dates-helper(start-date: "Mar 2020", end-date: "Dec 2021"),
)
- Developed data pipelines to gather public company information from various government APIs using *Python* and *GCP* (Pub/Sub + Cloud Functions + BigQuery)


== Technical Skills

- *Programming languages:* SQL, Python
- *Data Warehousing & Modeling:* BigQuery, Snowflake, dbt
- *Orchestration & ELT:* Airflow, Fivetran, Kubernetes
- *BI & Reporting:* Metabase, PowerBI, Looker Studio
- *Business Systems:* Salesforce, HubSpot


== Education

#edu(
  institution: "SGH Warsaw School of Economics",
  degree: "Master of Global Business, Finance and Governance",
  location: "Warsaw, Poland",
  dates: "2016 – 2018",
  consistent: true,
)

#edu(
  institution: "Cracow University of Economics",
  degree: "Bachelor of Finance and Accounting",
  location: "Kraków, Poland",
  dates: "2011 – 2014",
  consistent: true,
)


== Awards

#extracurriculars(
  activity: [*3rd Place, Global Legal Hackathon Warsaw* — for an online tool to speed up process of filling in contract parties. Turned into SimplifyDocs startup.],
  dates: "2020",
)

#extracurriculars(
  activity: [*2nd Place, Hack4Med Cracow Hackathon* — for a tool to evaluate muscle loss based on CT scans.],
  dates: "2021",
)
