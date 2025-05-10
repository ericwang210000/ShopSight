
<h1 style="margin-bottom: 0.2em;">🛍️ ShopSight</h1>

**ShopSight** is a privacy-conscious, computer-vision powered shopping assistant that uses live camera views to instantly retrieve detailed insights from **Sonar**, which include **price comparisons**, **reviews**, **brand details**, and **ethical sourcing insights**.

Built for **real-time, in-store use**, ShopSight runs fully on edge devices using Apple’s on-device machine learning for segmentation and leverages **Perplexity’s Sonar API** to retrieve and synthesize product data with citations.

## Mission: Transparency in Retail

In-store retail often makes it **hard to make informed decisions**:
- **Disingenuous** “SALE” indicators that trigger impulse buys without delivering competitive prices
- Ingredient or chemical composition information **hidden** in fine print
- Strategic shelving to **obscure** cheaper, generic alternatives
- **Lack accountability** of easily accessible, real customer reviews

### **ShopSight fixes that:**
| Category                  | What You Learn                                              |
|---------------------------|-------------------------------------------------------------|
| **Price Check**        | Comparitive pricing analysis, MSRP, unit cost, and independant alternative suggestions |
| **Reviews Summary**    | Top pros, cons, and hidden complaints from real users        |
| **Allergen Warnings**  | Key allergens, “may contain” risks, and ingredient clarity   |
| **Ethical Insights**   | Labor practices, sustainability rating, cruelty-free status  |
| **Brand Transparency** | Ownership, company practices, and house-brand comparisons        |
| **Optional Advanced Info**| Chemical toxicins (BPA, PFAS), regulatory red flags, price history, etc. |

We believe everyone should readily have **access to the truth behind the label** without expensing **time**, **money**, or **data privacy**.

## ✨ Features ✨ 

**On-Device Machine Learning for Product Segmentation**
  Apple’s DETR ResNet-50 model (Core ML) rapidly identifies the product in the iPhone's camera view

**AI-Powered Retrieval and Smart Summaries**  
  Perplexity Sonar performs deep multi-source research, returning cited comparisons, warnings, and insights in user-friendly formats

**Frictionless UI**  
  Auto-Segment: Automatically captures and queries the most prominent product in frame

**Privacy First**  
All computer-vision runs on-device—**no full images leave your device**
Only the cropped region is sent for analysis
No behavioral tracking or profiling common in online retail platforms

### Use Case

> You’re shopping for shampoo at a retail store. A "CLEARANCE" tag advertises a 20% discount.  
> You effortlessly scan the bottle in ShopSight and learn: 
> - It’s sold at the same price online—the sale is misleading  
> - Contains **methylisothiazolinone**, flagged for skin irritation  
> - The brand has a poor labor rating  

---

## Architecture Overview

    ┌───────────────────────────────┐
    │       iPhone Camera Feed      │
    └──────────────┬────────────────┘
                   ↓
    ┌───────────────────────────────┐
    │ DETR ResNet-50 (Core ML)      │
    │ On-device image segmentation  │
    └──────────────┬────────────────┘
                   ↓
    ┌───────────────────────────────┐
    │ Extract dominant product mask │
    │ Crop and compress product ROI │
    └──────────────┬────────────────┘
                   ↓
    ┌───────────────────────────────┐
    │ Perplexity Sonar API          │
    │ Image + query prompt          │
    │ Returns cited comparisons     │
    └──────────────┬────────────────┘
                   ↓
    ┌───────────────────────────────┐
    │ Render results in UI          │
    │ - Price breakdown             │
    │ - Reviews summary             │
    │ - Allergen/ethics info        │
    └───────────────────────────────┘


## Tech Stack

| Component        | Tech                          |
|------------------|-------------------------------|
| ROI Segmentation     | DETR ResNet-50 (Core ML)      |
| Sanitizing        | Privacy cropping + EXIF stripping |
| Retrieval         | Perplexity Sonar API          |
| UI                | SwiftUI                       |
| Device Support    | iPhone XR or newer (A12 Bionic+) |
---

## Setup Instructions

1. Clone this repo:

   ```bash
   git clone https://github.com/ericwang210000/shopsight
   cd shopsight
   ```

2. Open in Xcode

3. Ensure you have:

   * A real iOS device (model with Neural Engine preferred)
   * Access to the **Perplexity Pro API key** (included in `.env.sample`)

4. Run on device:

   ```bash
   xcodebuild -scheme ShopSight -destination 'platform=iOS,name=YourDevice'
   ```

## References
Apple Machine Learning: [https://developer.apple.com/machine-learning/](https://developer.apple.com/machine-learning/)
Sonar by Perplexity: [https://docs.perplexity.ai/home](https://docs.perplexity.ai/home)
DETR Paper: [https://arxiv.org/abs/2005.12872](https://arxiv.org/abs/2005.12872)

### Powered by Perplexity Sonar on Apple Silicon
ShopSight brings together the power of **Apple’s on-device intelligence** and **Perplexity’s trusted research engine** to deliver real-time product clarity **privately and effortlessly**.
