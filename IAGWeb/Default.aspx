<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IAGWeb._Default" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="TitleContent" runat="server">
    Bine ati venit ~ Willkommen
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%-- <div class="jumbotron">
        <h1>Student Informer</h1>
    </div>--%>

     <div class="row">
		<span class="image main"><img src="content/Brasov1.jpg" alt="" /></span>
		<h2>Despre Facultatea</h2>
		<p>   Învățământul superior brașovean datează din anul 1948, odată cu înființarea Institutului de Silvicultură din Brașov. Un an mai târziu apare Institutul de Mecanică. Astfel, se pun bazele Institutului Politehnic din Brașov (1956).</p>
		<p>   Profilul universitar se conturează la Brașov în 1960, anul în care ia ființă Facultatea de Matematică, componentă a Institutului Pedagogic din Brașov, alături de facultățile de Știinte Naturale, Fizică-Chimie și Muzică (apărută ulterior) .</p>
	    <p>   În 1971 învățământul superior brașovean se restructurează sub denumirea de Universitatea din Brașov, devenită în 1991 Universitatea Transilvania din Brașov. În cadrul acesteia, specializarile din domeniul matematic și informatic, cu durata studiilor de 4-5 ani funcționează succesiv în cadrul Facultății de Matematică și Informatică (1971-1974), Facultății de Științe (1974-1978), Facultății de Matematică (1978-1987), Facultății de Științe (1990-2001) și respectiv Facultății de Matematică și Informatică (din 2001). Sunt organizate studii de masterat în matematică și informatică (din 1995).</p>
        <p>   Din anul 2005 se trece la restructurarea tip Bologna a învățământului matematic și informatic. Noua organizare cuprinde ciclul de Licență (3 ani), ciclul de Masterat (2 ani) și ciclul de Doctorat (3 ani). Facultatea organizează 4 programe acreditate de Licență - învățământ de zi (Matematică Informatică, Informatică, Informatică aplicată în limba germană, Informatică aplicată), 3 programe de Masterat Bologna și un program de Licență InformaticăID - învățământ la distanță. În facultate activează în prezent 5 conducatori de doctorat.</p>
	 </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Profesorii</h2>
            <p>
                Daca doresti sa iei legatura cu unul dintre Profesori atunci 
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Apasa aici &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Informatii Utile</h2>
            <p>
                Pentru a afla progrmarea examenlor sau ce oportunitati
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Apasa aici &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
