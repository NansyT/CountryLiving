﻿#pragma checksum "..\..\Booking.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "3EC353091E2EB859D113EDC395DB4B90DCC151DA266547ED847986E8299A607D"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using LandLyst;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace LandLyst {
    
    
    /// <summary>
    /// Booking
    /// </summary>
    public partial class Booking : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 15 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox navn;
        
        #line default
        #line hidden
        
        
        #line 16 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox email;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox telefon;
        
        #line default
        #line hidden
        
        
        #line 18 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox addr;
        
        #line default
        #line hidden
        
        
        #line 20 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox by;
        
        #line default
        #line hidden
        
        
        #line 21 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox postnr;
        
        #line default
        #line hidden
        
        
        #line 24 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox datoStart;
        
        #line default
        #line hidden
        
        
        #line 25 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox datoSlut;
        
        #line default
        #line hidden
        
        
        #line 27 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock totalPris;
        
        #line default
        #line hidden
        
        
        #line 28 "..\..\Booking.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button bookVær;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/LandLyst;component/booking.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\Booking.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.navn = ((System.Windows.Controls.TextBox)(target));
            return;
            case 2:
            this.email = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.telefon = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.addr = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.by = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.postnr = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            this.datoStart = ((System.Windows.Controls.TextBox)(target));
            return;
            case 8:
            this.datoSlut = ((System.Windows.Controls.TextBox)(target));
            return;
            case 9:
            this.totalPris = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 10:
            this.bookVær = ((System.Windows.Controls.Button)(target));
            
            #line 28 "..\..\Booking.xaml"
            this.bookVær.Click += new System.Windows.RoutedEventHandler(this.BookVær_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

