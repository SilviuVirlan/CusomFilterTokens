pageextension 50100 "Bus. Mgr. RC Ext.FQ" extends "Business Manager Role Center"
{
    layout
    {
        addbefore("Favorite Accounts")
        {
            // action(MyCusts)
            // {
            //     ApplicationArea = All;
            //     Caption = 'My Customers**';
            //     RunObject = Page "My Customers";
            // }
            part("Favorite Customers"; "My Customers")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Favorite Customers';
            }
        }
    }
}