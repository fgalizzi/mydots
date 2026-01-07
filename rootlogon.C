{
  gStyle->SetOptFit(1111);
  gStyle->SetStatX(0.9); gStyle->SetStatY(0.9);
  ROOT::Math::MinimizerOptions::SetDefaultMinimizer("Minuit");
}

//Open a new TBrowser with nice settings
void nt(){
  gStyle->SetOptFit(1111); gStyle->SetOptTitle(0);
  gStyle->SetStatX(0.89); gStyle->SetStatY(0.89);
  gStyle->SetOptStat(1110);
  // gStyle->SetStatW(0.2); gStyle->SetStatH(0.2);
  // gStyle->SetStatFont(43);
  gStyle->SetStatFontSize(0.035);
  gStyle->SetStatBorderSize(0);

  // Axes
  gStyle->SetTitleFont(42, "xyz");
  gStyle->SetTitleFontSize(0.048);
  gStyle->SetTitleSize(0.058, "xyz");
  gStyle->SetTitleOffset(1., "x");
  gStyle->SetTitleOffset(1., "y");
  
  gStyle->SetLabelFont(42, "xyz");
  gStyle->SetLabelSize(0.05, "xyz");
  gStyle->SetLabelOffset(0.01, "y");

  gStyle->SetPadTickX(1); // Ticks on the upper border
  gStyle->SetPadTickY(1);
  gStyle->SetTickLength(0.033, "xyz");
  gStyle->SetNdivisions(506, "xyz");

  // Pad
  gStyle->SetPadLeftMargin(0.13);
  gStyle->SetPadRightMargin(0.10);
  gStyle->SetPadTopMargin(0.10);
  gStyle->SetPadBottomMargin(0.15);

  // Frame
  gStyle->SetFrameLineWidth(3);
  

  // Palette
  gStyle->SetPalette(kSunset); 
  gStyle->SetNumberContours(255);

  //Histograms
  gStyle->SetHistLineWidth(4); 
  gStyle->SetHistLineColor(kBlack);
  gStyle->SetHistFillStyle(3002);
  gStyle->SetHistFillColor(kBlack);

  //Functions
  gStyle->SetFuncWidth(3);
  

  gROOT->ForceStyle();
  new TBrowser("", "", 1200, 900);
};
